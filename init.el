(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(comment-multi-line t)
 '(comment-style 'aligned)
 '(copilot-chat-curl-proxy "http://webproxy.ext.ti.com:80")
 '(custom-enabled-themes '(misterioso))
 '(inhibit-startup-screen t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(ispell-dictionary nil)
 '(notmuch-saved-searches
   '((:name "lpr" :query "tag:ti-linux-patch-review" :key "l" :sort-order
	    newest-first)
     (:name "uboot" :query "tag:uboot" :key "u" :sort-order
	    newest-first)
     (:name "tbr" :query "tag:tiL-tbr" :key "t" :sort-order
	    newest-first)
     (:name "reviewed" :query "tag:tiL-reviewed" :key "r" :sort-order
	    newest-first)
     (:name "meta-ti" :query "tag:meta-ti" :key "m" :sort-order
	    newest-first)
     (:name "tiL-5.10" :query "tag:tiL-5.10" :key "5" :sort-order
	    newest-first)
     (:name "tiU21" :query "tag:tiU21" :key "2" :sort-order
	    newest-first)
     (:name "Inbox" :query "tag:Inbox" :key "i" :sort-order
	    newest-first)
     (:name "direct" :query "tag:direct" :key "d" :sort-order
	    newest-first)
     (:name "all mail" :query "*" :key "a" :sort-order newest-first)))
 '(org-hide-emphasis-markers t)
 '(package-check-signature nil)
 '(package-selected-packages
   '(aider aidermacs auto-complete bash-completion codeium company compat
	   consult copilot copilot-chat corfu counsel dired-single
	   docker docker-tramp doom-themes editorconfig embark
	   embark-consult expand-region flycheck highlight
	   highlight-80+ magit mailscripts marginalia multi-term
	   mutt-mode notmuch orderless paredit projectile realgud
	   smart-tab smart-tabs-mode solarized-theme sr-speedbar
	   stock-tracker sudo-edit use-package vala-mode vertico
	   visual-regexp visual-regexp-steroids which-key
	   xcscope zlc zone-tmux-clock zones))
 '(package-vc-selected-packages
   '((copilot-chat :vc-backend Git :url
		   "https://github.com/chep/copilot-chat.el")
     (copilot :vc-backend Git :url
	      "https://github.com/copilot-emacs/copilot.el")
     (codeium :vc-backend Git :url
	      "https://github.com/Exafunction/codeium.el")))
 '(projectile-enable-cmake-presets nil)
 '(projectile-track-known-projects-automatically nil)
 '(safe-local-variable-values
   '((c-offsets-alist (arglist-close . c-lineup-arglist-tabs-only)
		      (arglist-cont-nonempty c-lineup-gcc-asm-reg
					     c-lineup-arglist-tabs-only)
		      (arglist-intro . +) (brace-list-intro . +)
		      (c . c-lineup-C-comments) (case-label . 0)
		      (comment-intro . c-lineup-comment)
		      (cpp-define-intro . +) (cpp-macro . -1000)
		      (cpp-macro-cont . +) (defun-block-intro . +)
		      (else-clause . 0) (func-decl-cont . +)
		      (inclass . +)
		      (inher-cont . c-lineup-multi-inher)
		      (knr-argdecl-intro . 0) (label . -1000)
		      (statement . 0) (statement-block-intro . +)
		      (statement-case-intro . +) (statement-cont . +)
		      (substatement . +))
     (c-label-minimum-indentation . 0)))
 '(speedbar-visiting-file-hook
   '(sr-speedbar-visiting-file-hook (lambda nil (other-window 1))))
 '(stock-tracker-list-of-stocks '("AMZN" "TXN" "GOOG" "NFLX" "QCOM" "STM" "NVDA") t)
 '(stock-tracker-refresh-interval 5 t)
 '(stock-tracker-up-red-down-green nil t)
 '(term-default-fg-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-current-diff-A ((t (:foreground "black" :background "brown"))))
 '(ediff-current-diff-B ((t (:foreground "black" :background "green"))))
 '(ediff-current-diff-C ((t (:foreground "White" :background "orange"))))
 '(help-key-binding ((t (:background "green" :inherit fixed-pitch))))
 '(highlight ((t (:background "green" :foreground "black"))))
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-hash ((t (:foreground "blue"))))
 '(magit-section-highlight ((((type tty)) nil)))
 '(shadow ((t (:foreground "blue"))))
 '(speedbar-tag-face ((t (:foreground "brown"))))
 '(term ((t (:inherit nil))))
 '(term-color-black ((t (:background "light gray" :foreground "light gray"))))
 '(term-color-blue ((t (:background "cornflower blue" :foreground "cornflower blue"))))
 '(term-color-green ((t (:background "light sea green" :foreground "light sea green"))))
 '(term-color-magenta ((t (:background "dark magenta" :foreground "dark magenta"))))
 '(term-color-red ((t (:background "indian red" :foreground "indian red"))))
 '(term-color-white ((t (:background "white smoke" :foreground "white smoke"))))
 '(term-color-yellow ((t (:background "goldenrod" :foreground "goldenrod"))))
 '(whitespace-line ((t (:background "gray20" :foreground "red")))))

;; follow sym-link ;;
(setq vc-follow-symlinks t)

;;weird symbol
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(add-to-list 'load-path "~/.emacs.d/.config")
;;(load "ti-setup.el")

(defun set-u-boot-directory (path)
  "Set ti-u-boot directory This
overrides the current directory, which would otherwise be used."
  (interactive "Dti-u-boot Directory: ")
  (setq ti-u-boot-path path)
  (setq work_dir_2 ti-u-boot-path))

(defun set-kernel-directory (path)
  "Set ti-kernel directory This
overrides the current directory, which would otherwise be used."
  (interactive "Dti-kernel Directory: ")
  (setq ti-kernel-path path)
  (setq work_dir_3 ti-kernel-path))

(defun set-kig-directory (path)
  "Set ti-kig directory This
overrides the current directory, which would otherwise be used."
  (interactive "Dti-kig Directory: ")
  (setq ti-kig-path path)
  (setq work_dir_4 ti-kig-path))

(defun set-working-project-directory (path)
  "Set working-project directory This
overrides the current directory, which would otherwise be used."
  (interactive "Dworking-project Directory: ")
  (setq working-project-path path)
  (ti-setup)
  )

;; mutt

;;(server-start)
;;(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

;;stock-tracker
;; Refresh stock price every 5*10 secs
(customize-set-variable 'stock-tracker-refresh-interval 5)

;; Set up as green, down as red
(customize-set-variable 'stock-tracker-up-red-down-green nil)

;; Customize stocks
(customize-set-variable 'stock-tracker-list-of-stocks
                        '("AMZN"
			  "TXN"
			  "GOOG"
			  "NFLX"
			  "QCOM"
			  "STM"
			  "NVDA"))

;;notmuch
(require 'notmuch)			        ;;
(setq send-mail-function 'sendmail-send-it   ;;
      sendmail-program "/usr/bin/msmtp"      ;;
      mail-specify-envelope-from t	        ;;
      message-sendmail-envelope-from 'header ;;
      mail-envelope-from 'header)	        ;;
(global-set-key (kbd "M-m") 'notmuch)        ;;

(defun mailscripts--check-out-branch (branch)
  "Check out or create BRANCH in the current git repository."
  (if (string-empty-p branch)
      (message "Applying to current HEAD")
    (let ((result (call-process "git" nil nil nil "checkout" "-b" branch)))
      (when (not (= result 0))
        ;; Branch might already exist, try to check it out
        (call-process "git" nil nil nil "checkout" branch)))))

(defun notmuch-check-patch (repo branch &optional reroll-count)
  "Extract patch series in current thread to branch BRANCH in repo REPO.

The target branch may or may not already exist.

With an optional prefix numeric argument REROLL-COUNT, try to
extract the nth revision of a series.  See the --reroll-count
option detailed in mbox-extract-patch(1).

See notmuch-extract-patch(1) manpage for limitations: in
particular, this Emacs Lisp function supports passing only entire
threads to the notmuch-extract-patch(1) command."
  (interactive
   "Dgit repo: \nsnew branch name (or leave blank to apply to current HEAD): \nP")
  (let ((thread-id
         ;; If `notmuch-show' was called with a notmuch query rather
         ;; than a thread ID, as `org-notmuch-follow-link' in
         ;; org-notmuch.el does, then `notmuch-show-thread-id' might
         ;; be an arbitrary notmuch query instead of a thread ID.  We
         ;; need to wrap such a query in thread:{} before passing it
         ;; to notmuch-extract-patch(1), or we might not get a whole
         ;; thread extracted (e.g. if the query is just id:foo)
         (if (string= (substring notmuch-show-thread-id 0 7) "thread:")
             notmuch-show-thread-id
           (concat "thread:{" notmuch-show-thread-id "}")))
        (default-directory (expand-file-name repo)))
    (mailscripts--check-out-branch branch)
    (message "thread-id %s" thread-id) 
    (shell-command
     (if reroll-count
         (format "notmuch-extract-patch -v%d %s | ./scripts/checkpatch.pl --strict"
                 (prefix-numeric-value reroll-count)
                 (shell-quote-argument thread-id))
       (format "notmuch-extract-patch %s | ./scripts/checkpatch.pl --strict"
	       (shell-quote-argument thread-id)))
     "*notmuch-apply-thread-series*")))


(defun b4-check-patch-process (repo branch)
  (interactive
   "Dgit repo: \nsnew branch name (or leave blank to apply to current HEAD): \n")
  (let ( (message-id (notmuch-show-get-message-id t)) ;;
         (default-directory (expand-file-name projectile-root)) ;;
	 )

    ;; Check if we have a valid message-id
    (unless message-id
      (error "No message-id found. Make sure you're in a notmuch-show buffer"))
    
    ;; Check if projectile-root is set
    (unless (and (boundp 'projectile-root) projectile-root)
      (error "projectile-root is not set. Make sure you're in a projectile project"))
    
    ;; Check if the directory exists
    (unless (file-directory-p (expand-file-name projectile-root))
      (error "Project directory does not exist: %s" projectile-root))

    ;; Check if we're in a git repository
    (unless (file-directory-p (expand-file-name ".git" projectile-root))
      (error "Not in a git repository: %s" projectile-root))

    (message "Processing patch for message-id: %s" message-id)
    
    ;; Clean up any previous git am operation
    (let ((result (call-process-shell-command (format "git am --abort > b4-check-patch 2>&1"))))
      (message "Git am abort result: %d" result))
    
    ;; Switch to master and pull latest changes
    (let ((result (call-process-shell-command (format "git checkout master >> b4-check-patch 2>&1"))))
      (unless (= result 0)
        (error "Failed to checkout master branch. Check b4-check-patch for details")))
    
    (let ((result (call-process-shell-command (format "git pull origin master >> b4-check-patch 2>&1"))))
      (unless (= result 0)
        (message "Warning: Failed to pull from origin master. Continuing anyway...")))
    
    ;; Clean up old branches
    (call-process-shell-command (format "git branch |grep \"\\.\" | xargs git branch -D > b4-check-patch 2>&1"))
    
    ;; Create new branch
    (let ((result (call-process-shell-command (format "git checkout -b %s >> b4-check-patch 2>&1" message-id))))
      (unless (= result 0)
        (error "Failed to create branch %s. Check b4-check-patch for details" message-id)))
    
    ;; Process the patch with b4
    (let ((result (call-process-shell-command  ;;
                   (format (concat "rm -rf b4-patch; mkdir -p b4-patch && b4 am -Q " message-id " -o b4-patch >> b4-check-patch 2>&1 || b4 am -Q -m ~/Mail/direct/ " message-id " -o b4-patch >> b4-check-patch 2>&1" "; ./scripts/checkpatch.pl --strict b4-patch/*.patches/*.patch >> b4-check-patch 2>&1;"  "cat b4-check-patch | " "if grep -q \" style problems\"; then : ;else git am b4-patch/*.mbx >> b4-check-patch 2>&1;fi ")) nil t nil)))
      (message "b4 processing completed with result: %d" result))
    )
  
  (let ( (default-directory (expand-file-name projectile-root)) ;;
	 )
    (pop-to-buffer (find-file "b4-check-patch"))) 
  )




(defun b4-check-patch ()
  (interactive)
  (funcall-interactively 'b4-check-patch-process projectile-root "b4-new")
  )

(defun mbox-check-patch-notmuch-messages ()
  "When this function is executed in notmuch-show buffer all the \"open\"
messages will be written to the file ~/tmp-check-patch (overwriting it)."
  (interactive)
  (let* ((search-terms-list (notmuch-show-get-message-ids-for-open-messages))
	 (default-directory (or (bound-and-true-p work_dir_1) default-directory))
	 (buffer (get-buffer-create "output-mbox")))
    (set-buffer buffer)
    (setq buffer-read-only nil)
    (buffer-disable-undo)
    (pop-to-buffer buffer)
    (goto-char (point-max))
    (if (> (buffer-size) 0)
	(insert "\n\n"))
    (insert (format-time-string
	     "%c: Writing the following messages to ~/tmp-mbox:\n ")
	    (mapconcat 'identity search-terms-list "\n ") "\n")
    (with-temp-file "~/check-patch-output" 
      (while search-terms-list
	(call-process-shell-command
	 (format (concat "notmuch show --format=mbox " (pop search-terms-list) " | tee tmp" " | " "if grep -q \"Re:\"; then : ;else ./scripts/checkpatch.pl tmp;fi")) nil t nil)	  ;;
	)
      )
    ))

(defun mbox-open-notmuch-messages ()
  "When this function is executed in notmuch-show buffer all the \"open\"
messages will be written to the file ~/tmp-mbox (overwriting it)."
  (interactive)
  (let ((search-terms-list (notmuch-show-get-message-ids-for-open-messages))
	(buffer (get-buffer-create "* Contents of ~/tmp-mbox *")))
    (set-buffer buffer)
    (setq buffer-read-only nil)
    (buffer-disable-undo)
    (pop-to-buffer buffer)
    (goto-char (point-max))
    (message "notmuch-command %s" notmuch-command)
    (if (> (buffer-size) 0)
	(insert "\n\n"))
    (insert (format-time-string
	     "%c: Writing the following messages to ~/tmp-mbox:\n ")
	    (mapconcat 'identity search-terms-list "\n ") "\n")
    (with-temp-file "~/tmp-mbox"
      (call-process notmuch-command nil t nil "show" "--format=mbox"
		    (mapconcat 'identity search-terms-list " OR ")))
    (insert "\nMessages in ~/tmp-mbox:\n")
    (call-process "mail" nil t nil
		  "-H" "-f" (expand-file-name "~/tmp-mbox"))))


;; (use-package notmuch-bookmarks
;;   :after notmuch
;;   :config
;;   (notmuch-bookmarks-mode))

(setq notmuch-address-selection-function
      (lambda (prompt collection initial-input)
        (completing-read prompt (cons initial-input collection) nil t nil 'notmuch-address-history)))

(defun my-notmuch-show-view-as-patch ()
  "View the the current message as a patch."
  (interactive)
  (let* ((id (notmuch-show-get-message-id))
         (msg (notmuch-show-get-message-properties))
         (part (notmuch-show-get-part-properties))
         (subject (concat "Subject: " (notmuch-show-get-subject) "\n"))
         (diff-default-read-only t)
         (buf (get-buffer-create (concat "*notmuch-patch-" id "*")))
         (map (make-sparse-keymap)))
    (define-key map "q" 'notmuch-bury-or-kill-this-buffer)
    (switch-to-buffer buf)
    (let ((inhibit-read-only t))
      (erase-buffer)
      (insert subject)
      (insert (notmuch-get-bodypart-text msg part nil)))
    (set-buffer-modified-p nil)
    (diff-mode)
    (lexical-let ((new-ro-bind (cons 'buffer-read-only map)))
                 (add-to-list 'minor-mode-overriding-map-alist new-ro-bind))
    (goto-char (point-min))))

(define-key 'notmuch-show-part-map "d" 'my-notmuch-show-view-as-patch)

(eval-after-load 'notmuch-show
  '(define-key notmuch-show-mode-map "`" 'notmuch-show-apply-tag-macro))

(setq notmuch-show-tag-macro-alist
      (list

       '("m" "+notmuch::patch" "+notmuch::moreinfo" "-notmuch::needs-review")
       '("n" "+notmuch::patch" "+notmuch::needs-review" "-notmuch::pushed")
       '("o" "+notmuch::patch" "+notmuch::obsolete"
         "-notmuch::needs-review" "-notmuch::moreinfo")
       '("p" "-notmuch::pushed" "-notmuch::needs-review"
	 "-notmuch::moreinfo" "+pending")
       '("P" "-pending" "-notmuch::needs-review" "-notmuch::moreinfo" "+notmuch::pushed")
       '("r" "-notmuch::patch" "+notmuch::review")
       '("s" "+notmuch::patch" "-notmuch::obsolete" "-notmuch::needs-review" "-notmuch::moreinfo" "+notmuch::stale")
       '("t" "+notmuch::patch" "-notmuch::needs-review" "+notmuch::trivial")
       '("w" "+notmuch::patch" "+notmuch::wip" "-notmuch::needs-review")))

(defun notmuch-show-apply-tag-macro (key)
  (interactive "k")
  (let ((macro (assoc key notmuch-show-tag-macro-alist)))
    (apply 'notmuch-show-tag-message (cdr macro))))

;; packages


					;(with-eval-after-load 'gnutls
					;    (add-to-list 'gnutls-trustfiles "/etc/ssl/certs/ca-certificates.crt"))
;;(setq url-using-proxy t)
(setq url-debug t)
;;(url-retrieve-synchronously (url-generic-parse-url "https://elpa.gnu.org/"))
(setq url-proxy-services
      '(("no_proxy" . "ti.com")
        ("http" . "webproxy.ext.ti.com:80")
        ("https" . "webproxy.ext.ti.com:80")
        ("ftp" . "webproxy.ext.ti.com:80")))
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")  ;; ;;

(setq package-archive-priorities '(("gnu" . 10)
                                   ("melpa" . 5))
      package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://stable.melpa.org/packages/")
                         ("melpa-devel" . "https://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))


(use-package paredit
  :ensure t)
;; packages end

;;vertical split
(setq split-width-threshold 0)
(setq split-height-threshold nil)

;;password mask
;; (setq comint-password-prompt-regexp eshell-password-prompt-regexp) ;;

(keyboard-translate ?\C-q ?\C-h)

;;vertico
;; Enable vertico
(use-package vertico
  :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

;;codeium
;; (load "codeium-config.el")  ;; ;; ;;

;; copilot
;; (load "copilot-config.el")  ;;



;;savehist
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  
  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to te
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

;;embark
(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc. You may adjust the
  ;; Eldoc strategy, if you want to see the documentation from
  ;; multiple providers. Beware that using this can be a little
  ;; jarring since the message shown in the minibuffer can be more
  ;; than one line, causing the modeline to move up and down:

  ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(package-initialize)
(require 'consult)
(require 'vertico)
(vertico-mode)
(setq completion-styles '(substring basic))


;; docker
;; Open files in Docker containers like so: /docker:drunk_bardeen:/etc/passwd

(require 'tramp)

(use-package docker
  :defer t
  :ensure t
  :config
  (docker-global-mode)) ;; manage docker containers

(defadvice tramp-completion-handle-file-name-all-completions
    (around dotemacs-completion-docker activate)
  "(tramp-completion-handle-file-name-all-completions \"\" \"/docker:\" returns
    a list of active Docker container names, followed by colons."
  (if (equal (ad-get-arg 1) "/docker:")
      (let* ((dockernames-raw (shell-command-to-string "docker ps | awk '$NF != \"NAMES\" { print $NF \":\" }'"))
	     (dockernames (cl-remove-if-not
			   #'(lambda (dockerline) (string-match ":$" dockerline))
			   (split-string dockernames-raw "\n"))))
	(setq ad-return-value dockernames))
    ad-do-it))
(setq tramp-debug-buffer t)
(setq tramp-verbose 10)

;; shell
(require 'bash-completion)
(bash-completion-setup)

;; cscope start

(setq cscope-do-not-update-database t)
(setq cscope-display-cscope-buffer nil)
(require 'xcscope)
(cscope-setup)

;; cscope end

;;cursor

(set-cursor-color "Orange")

;; whitespaces 80 cloumn rule
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t) ;;

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux
kernel."
  (interactive)
  (setq c-basic-offset 8)
  (setq c-indent-level 8)
  (setq c-brace-imaginary-offset 0)
  (setq c-brace-offset -8)
  (setq c-argdecl-indent 8)
  (setq c-label-offset -8)
  (setq c-continued-statement-offset 8)
  (setq indent-tabs-mode nil)
  (setq tab-width 8)
  (setq c-set-style "linux-tabs-only")
  )

(add-hook 'c-mode-hook 'linux-c-mode) ;; ;;

;; (dir-locals-set-class-variables
;;  'linux-kernel
;;  '((c-mode . (
;; 	      (c-basic-offset . 8)
;; 	      (c-label-minimum-indentation . 0)
;; 	      (c-offsets-alist . (
;; 				  (arglist-close         . c-lineup-arglist-tabs-only)
;; 				  (arglist-cont-nonempty .
;; 							 (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
;; 				  (arglist-intro         . +)
;; 				  (brace-list-intro      . +)
;; 				  (c                     . c-lineup-C-comments)
;; 				  (case-label            . 0)
;; 				  (comment-intro         . c-lineup-comment)
;; 				  (cpp-define-intro      . +)
;; 				  (cpp-macro             . -1000)
;; 				  (cpp-macro-cont        . +)
;; 				  (defun-block-intro     . +)
;; 				  (else-clause           . 0)
;; 				  (func-decl-cont        . +)
;; 				  (inclass               . +)
;; 				  (inher-cont            . c-lineup-multi-inher)
;; 				  (knr-argdecl-intro     . 0)
;; 				  (label                 . -1000)
;; 				  (statement             . 0)
;; 				  (statement-block-intro . +)
;; 				  (statement-case-intro  . +)
;; 				  (statement-cont        . +)
;; 				  (substatement          . +)
;; 				  ))
;; 	      (indent-tabs-mode . t)
;; 	      (show-trailing-whitespace . t)
;; 	      ))))

;; (defun linux-kernel-coding-style/c-lineup-arglist-tabs-only (ignored)
;;   "Line up argument lists by tabs, not spaces"
;;   (let* ((anchor (c-langelem-pos c-syntactic-element))
;; 	 (column (c-langelem-2nd-pos c-syntactic-element))
;; 	 (offset (- (1+ column) anchor))
;; 	 (steps (floor offset c-basic-offset)))
;;     (* (max steps 1)
;;        c-basic-offset)))

;; ;; Add Linux kernel style
;; (add-hook 'c-mode-common-hook
;; 	  (lambda ()
;; 	    (c-add-style "linux-kernel"
;; 			 '("linux" (c-offsets-alist
;; 				    (arglist-cont-nonempty
;; 				     c-lineup-gcc-asm-reg
;; 				     linux-kernel-coding-style/c-lineup-arglist-tabs-only))))))

;; (defun linux-kernel-coding-style/setup ()
;;   (let ((filename (buffer-file-name)))
;;     ;; Enable kernel mode for the appropriate files
;;     (when (and filename
;; 	       (or (locate-dominating-file filename "Kbuild")
;; 		   (locate-dominating-file filename "Kconfig")
;; 		   (save-excursion (goto-char 0)
;; 				   (search-forward-regexp "^#include <linux/\\(module\\|kernel\\)\\.h>$" nil t))))
;;       (setq indent-tabs-mode t)
;;       (setq tab-width 8)
;;       (setq c-basic-offset 8)
;;       (c-set-style "linux-kernel")
;;       (message "Setting up indentation for the linux kernel"))))

;; (add-hook 'c-mode-hook 'linux-kernel-coding-style/setup)

;; indentaion style end


;; tramp
;; (setq tramp-default-method "ssh") ;;
(with-eval-after-load 'tramp
  (add-to-list 'tramp-methods
	       '("ssh"
                 (tramp-login-program        "ssh")
                 (tramp-login-args           (("-l" "%u") ("-p" "%p") ("%c")
					      ("-A" "-oHostKeyAlgorithms=+ssh-rsa")
					      ("-e" "none") ("-X") ("%h")))
                 (tramp-async-args           (("-q")))
                 (tramp-remote-shell         "/bin/sh")
                 (tramp-remote-shell-login   ("-l"))
                 (tramp-remote-shell-args    ("-c"))
                 (tramp-gw-args              (("-o" "GlobalKnownHostsFile=/dev/null")
					      ("-o" "UserKnownHostsFile=/dev/null")
					      ("-o" "StrictHostKeyChecking=no")
					      ("-o" "ForwardX11=yes")))
                 (tramp-default-port         22))))

;; emacs client
(require 'server)
(or (server-running-p) (server-start))
;; emacs client end


;; comment style
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end) comment-style 'multi-line)
      (setq beg (line-beginning-position) end (line-end-position) comment-style 'aligned))
    (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region-or-line)
;; comment style end 



;; region casing
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; regio casing end



;; normal autocmplete
(require 'auto-complete)
(global-auto-complete-mode t)
;; normal autocomplet end


;; parenthesis
(show-paren-mode t)

(defadvice show-paren-function
    (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
	 (matching-text (and cb
			     (char-equal (char-syntax cb) ?\) )
			     (blink-matching-open))))
    (when matching-text (message matching-text))))


;; parenthesis end

;; magit
(add-to-list 'load-path "~/.emacs.d/site-lisp/magitlisp")
(require 'magit)
(global-unset-key (kbd "M-q")) ;;
(global-set-key (kbd "M-q") 'magit)


(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/site-lisp/magit/Documentation/"))
;; magits end

;; consult-history
(global-set-key (kbd "C-c r") 'consult-history)

;;zsh
;; (require 'zlc) ;;
;; (zlc-mode t) ;;


;; mutiiterm
(require 'multi-term)
(setq multi-term-program "/bin/bash")
;; multiterm end

;; org-mode

(setq org-agenda-files '("~/tasks.org"))

;; (define-skeleton org-skeleton
;;   "In-buffer settings info for a emacs-org file."
;;   "Title: "
;;   "#+TITLE:" str " \n"
;;   "#+AUTHOR: Your Name\n"
;;   "#+email: your-email@server.com\n"
;;   "#+INFOJS_OPT: \n"
;;   "#+BABEL: :session *R* :cache yes :results output graphics :exports both :tangle yes \n"
;;   "-----"
;;   )



;; Custom legato


;; first file
(pop-to-buffer (find-file "~/.emacs.d/init.el"))
(defun dotemacs()
  (interactive )
  (let* ((buffer-name (format "init.el"))
         (buffer (get-buffer buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      (pop-to-buffer (find-file "~/.emacs.d/init.el"))
      )))
;; first file end



(setq url-proxy-services
      '(("no_proxy" . "127.0.0.1")))
;; (require 'dired+)
;; (diredp-toggle-find-file-reuse-dir 1)

;; disable auto-save and auto-backup
;; (setq auto-save-default nil)
;; (setq make-backup-files nil)
;; disable auto save and auto backup end





;; (diredp-toggle-find-file-reuse-dir 1)
;; (put 'dired-find-alternate-file 'disabled nil)


;; (require 'dired+)
;; (diredp-toggle-find-file-reuse-dir 1)

;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)


;;Serial term

(defun dserial-usb0()
  (interactive )
  (setq buffer-name-1 "/dev/ttyUSB0")
  (if (get-buffer buffer-name-1)
      (switch-to-buffer buffer-name-1)
    ;; (serial-term)
    
    (make-serial-process :port "/dev/ttyUSB0" :speed 115200)
    (serial-process-configure :process "/dev/ttyUSB0" :speed 115200)
    (switch-to-buffer buffer-name-1)
    ))

(defun dserial-usb1()
  (interactive )
  (setq buffer-name-1 "/dev/ttyUSB1")
  (if (get-buffer buffer-name-1)
      (switch-to-buffer buffer-name-1)
    (make-serial-process :port "/dev/ttyUSB1" :speed 115200)
    (switch-to-buffer buffer-name-1)
    ))

;; term mode control characters
(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))

(add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-escape))

(defun term-send-X ()
  "Send X in term mode."
  (interactive)
  (term-send-raw-string "\C-x"))

(add-to-list 'term-bind-key-alist '("C-c C-x" . term-send-X))


(defun term-send-reverse-search ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\C-r"))

(add-to-list 'term-bind-key-alist '("C-c C-r" . term-send-reverse-search))

(defun term-send-ctrl-s ()
  "Send Ctrl-s in term mode."
  (interactive)
  (term-send-raw-string "\C-s"))

(add-to-list 'term-bind-key-alist '("C-c C-s" . term-send-ctrl-s))

;; term mode control characters end



(setq default-process-coding-system '(utf-8-unix . utf-8-unix))


;; (setq compilation-read-command nil)

(setq compilation-scroll-output t)

(setq compilation-scroll-output 'first-error)








;; ediff

(setq ediff-split-window-function 'split-window-horizontally)







;; compilation end

;; add it to .bashrc
;; function e() {
;;      if test -e "/tmp/emacs1000/server" || test -e "~/.emacs.d/server"
;;      then
;;              emacsclient "$@" &
;;              echo "opening the file with previous emacs instance"
;;      else
;;              emacs "$@" &
;;              echo "creating new emacs instance"
;;      fi
;;              }

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(load "shortcuts.el")

(load "compile-config.el")

(defun send-invisible-in-other-window()
  (interactive)
  (other-window 0)
  (comint-send-invisible)
  )

(load "ediff-config.el")
(load "keyboard-macros.el")
(load "serial-ports.el")
(load "final.el")

(put 'list-timers 'disabled nil)
