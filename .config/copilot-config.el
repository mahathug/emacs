;; (unless (package-installed-p 'copilot-chat)
;;   (package-vc-install "https://github.com/chep/copilot-chat.el"))
;; (require 'copilot-chat)

(use-package copilot-chat)
(add-hook 'git-commit-setup-hook 'copilot-chat-insert-commit-message) ;;

;; ;;copilot
;; (use-package copilot
;;   :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
;;   :ensure t)
(unless (package-installed-p 'copilot)
  (package-vc-install "https://github.com/copilot-emacs/copilot.el"))
(require 'copilot)

(add-hook 'prog-mode-hook 'copilot-mode)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
;; (setq copilot-network-proxy '(:host "127.0.0.1" :port 7890 :username: "user" :password: "password"))
;; Persist history over Emacs restarts. Vertico sorts by history position.
