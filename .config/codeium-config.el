(unless (package-installed-p 'codeium)
  (package-vc-install "https://github.com/Exafunction/codeium.el"))
(require 'codeium)

(setq url-proxy-services
      '(("no_proxy" . "127.0.0.1")))
(setq-default codeium-enterprise t)
(setq-default codeium-portal-url "https://dleaiml001.itg.ti.com")
(setq-default codeium-api-url "https://dleaiml001.itg.ti.com/_route/api_server")


;; we recommend using use-package to organize your init.el
(use-package codeium
    ;; if you use straight
    ;; :straight '(:type git :host github :repo "Exafunction/codeium.el")
    ;; otherwise, make sure that the codeium.el file is on load-path

    :init
    ;; use globally
    (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
    ;; or on a hook
    (add-hook 'python-mode-hook
        (lambda ()
            (setq-local completion-at-point-functions '(codeium-completion-at-point))))

    ;; if you want multiple completion backends, use cape (https://github.com/minad/cape):
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions
    ;;             (list (cape-capf-super #'codeium-completion-at-point #'lsp-completion-at-point)))))
    ;; an async company-backend is coming soon!

    ;; codeium-completion-at-point is autoloaded, but you can
    ;; optionally set a timer, which might speed up things as the
    ;; codeium local language server takes ~0.2s to start up
    (add-hook 'emacs-startup-hook
     (lambda () (run-with-timer 0.1 nil #'codeium-init)))

    ;; :defer t ;; lazy loading, if you want
    :config
    (setq use-dialog-box nil) ;; do not use popup boxes

    ;; if you don't want to use customize to save the api-key
    (setq codeium/metadata/api_key "b229d091-fe36-4911-9023-915c470b5571")

    ;; get codeium status in the modeline
    (setq codeium-mode-line-enable
        (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
    (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
    ;; alternatively for a more extensive mode-line
    (add-to-list 'mode-line-format '(-50 "" codeium-mode-line) t)

    ;; use M-x codeium-diagnose to see apis/fields that would be sent to the local language server
    (setq codeium-api-enabled
        (lambda (api)
            (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion))))
    ;; you can also set a config for a single buffer like this:
    (add-hook 'python-mode-hook
        (lambda ()
            (setq-local codeium/editor_options/tab_size 4)))

    ;; You can overwrite all the codeium configs!
    ;; for example, we recommend limiting the string sent to codeium for better performance
    (defun my-codeium/document/text ()
        (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
    ;; if you change the text, you should also change the cursor_offset
    ;; warning: this is measured by UTF-8 encoded bytes
    (defun my-codeium/document/cursor_offset ()
        (codeium-utf8-byte-length
            (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
    (setq codeium/document/text 'my-codeium/document/text)
    (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))

(use-package company
    :defer 0.1
    :config
    (global-company-mode t)
    (setq-default
        company-idle-delay 0.05
        company-require-match nil
        company-minimum-prefix-length 0

        ;; get only preview
        company-frontends '(company-preview-frontend)
        ;; also get a drop down
        ;; company-frontends '(company-pseudo-tooltip-frontend company-preview-frontend)
        ))

(cl-letf*
    (
        ;; making a new codeium-state (thus a new local language server process)
        ;; takes ~0.2 seconds; avoid when possible
        (state (codeium-state-make :name "example"))
        ((codeium-config 'codeium/document/text state) "def fibi(n):")
        ((codeium-config 'codeium/document/cursor_offset state) 12)
        ((codeium-config 'codeium-api-enabled state) (lambda (api) (eq api 'GetCompletions))))
    (unwind-protect
        (progn
            (codeium-init state)
            ;; make async requests using codeium-request
            (cdr (codeium-request-synchronously 'GetCompletions state nil)))
        ;; cleans up temp files, kill process. Scheduled async requests on this state will be dropped.
        (codeium-reset state)))

;; (defun codeium-chat (query)
;;   "Send QUERY to Codeium Chat and display the response."
;;   (interactive "sEnter your query: ")
;;   (let* ((api-key "b229d091-fe36-4911-9023-915c470b5571")
;;         (url "https://dleaiml001.itg.ti.com/_route/api_server")
;;         (headers `(("Content-Type" . "application/json")
;;                    ("Authorization" . ,(concat "Bearer " api-key))))
;;         (data (json-encode `(("query" . ,query)))))
;;     (request
;;       url
;;       :type "POST"
;;       :headers headers
;;       :data data
;;       :parser 'json-read
;;       :success (cl-function
;;                 (lambda (&key data &allow-other-keys)
;;                   (let ((response (assoc-default 'response data)))
;;                     (with-output-to-temp-buffer "*Codeium Chat*"
;;                       (princ response)))))
;;       :error (cl-function
;;               (lambda (&key error-thrown &allow-other-keys)
;;                 (message "Error: %S" error-thrown))))))


;; (global-set-key (kbd "C-c c") 'codeium-chat) ;;


; for chat
(setq index-service nil)														       ;;
																	       ;;
(setq codeium-apis															       ;;
      '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion GetProcesses))		       ;;
																	       ;;
(setq codeium-api-enabled														       ;;
      (lambda (api)															       ;;
        (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion GetProcesses))))	       ;;
																	       ;;
(setq codeium-fields-regexps														       ;;
      `(																       ;;
        (GetCompletions .														       ;;
			,(rx bol "codeium/" (or "metadata" "document" "editor_options") "/" (* anychar) eol))				       ;;
        (Heartbeat .															       ;;
                   ,(rx bol "codeium/metadata/" (* anychar) eol))									       ;;
        (CancelRequest .														       ;;
                       ,(rx bol "codeium/" (or (seq "metadata/" (* anychar)) "request_id")  eol))					       ;;
        (GetAuthToken)														       ;;
        (RegisterUser .														       ;;
                      ,(rx bol "codeium/firebase_id_token" eol))									       ;;
        (AcceptCompletion .														       ;;
			  ,(rx bol "codeium/" (or (seq "metadata/" (* anychar)) "completion_id")  eol))					       ;;
        (GetProcesses .														       ;;
                      ,(rx bol "codeium/metadata/" (* anychar) eol))									       ;;
        ))																       ;;
																	       ;;
(codeium-def codeium-command (api state)												       ;;
	     (unless (codeium-state-manager-directory state)										       ;;
               (setf (codeium-state-manager-directory state) (make-temp-file "codeium_" t)))						       ;;
	     `(,(codeium-get-config 'codeium-command-executable api state)								       ;;
               "--api_server_url" ,(codeium-get-config 'codeium-api-url api state)							       ;;
               "--manager_dir" ,(codeium-state-manager-directory state)								       ;;
               "--register_user_url" ,(codeium-get-config 'codeium-register-user-url api state)					       ;;
               ,@(if (codeium-get-config 'codeium-enterprise api state) '("--enterprise_mode"))					       ;;
               "--portal_url" ,(codeium-get-config 'codeium-portal-url api state)							       ;;
               "--enable_chat_web_server" "--enable_chat_client"									       ;;
               ,@(if index-service '("--enable_index_service"))))									       ;;
																	       ;;
(defun codeium-chat-url () ""													       ;;
       (progn															       ;;
         (codeium-request 'GetProcesses codeium-state nil										       ;;
                          (lambda (res)												       ;;
                            (if (listp res)												       ;;
				(setq chat-client-port (alist-get 'chatClientPort res)							       ;;
                                      chat-webserver-port (alist-get 'chatWebServerPort res))					       ;;
                              (error "Cannot get chat client from res"))))								       ;;
         (concat "http://127.0.0.1:"													       ;;
                 (number-to-string chat-client-port)											       ;;
                 "?api_key="														       ;;
                 codeium/metadata/api_key												       ;;
                 "&has_enterprise_extension="											       ;;
                 (if codeium-enterprise "true" "false")										       ;;
                 "&web_server_url=ws://127.0.0.1:"											       ;;
                 (number-to-string chat-webserver-port)										       ;;
                 "&ide_name=emacs"													       ;;
                 "&ide_version="													       ;;
                 (eval emacs-version)												       ;;
                 "&app_name=codeium.el"												       ;;
                 "&extension_name=codeium.el"											       ;;
                 "&extension_version="												       ;;
                 (eval codeium-local-server-version)											       ;;
                 "&ide_telemetry_enabled=true"											       ;;
                 "&has_index_service="												       ;;
                 (if index-service "true" "false")											       ;;
                 "&locale=en_US")))													       ;;
																	       ;;
																	       ;;
(defun codeium-chat-open () (interactive)												       ;;
       (start-process "codeium chat" nil "xdg-open" (codeium-chat-url)))								       ;;
