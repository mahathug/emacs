(require 'projectile)

(setq compilation-read-command nil)

(setq projectile-sort-order 'recently-active)

(setq projectile-enable-caching nil)

(setq projectile-require-project-root t)

(setq projectile-switch-project-action #'projectile-dired) ;;

;; (setq projectile-switch-project-action #'projectile-find-dir) ;; ;;

;; (setq projectile-find-dir-includes-top-level t) ;; ;;

(setq projectile-per-project-compilation-buffer t)


;; (setq projectile-sort-order 'modification-time) ;;
;; (add-hook 'projectile-idle-timer-hook #'my-projectile-idle-timer-function) ;;


;;projectile

;; Recommended keymap prefix on Windows/Linux
(setq projectile-ignored-projects '("~/")) ;;
(setq projectile-project-search-path '("~/.emacs.d/"
                                        "~/am62/binman/cryptodev-2.6"
                                        "~/am62/binman/linux-next-upstream"
                                        "~/am62/binman/u-boot"
                                        "~/ti-processor-sdk-linux-am62lxx-evm-11.00.15.05"
                                        "~/ti-processor-sdk-linux-am62xx-evm-11.00.09.04"
                                        "~/am62/binman/processor-sdk-doc"
                                        ("~/am62/binman/am62l-wakeup/" . 1))) ;;
(define-key projectile-mode-map (kbd "M-e") 'projectile-command-map)
(define-key projectile-mode-map (kbd "M-a") 'projectile-commander)
(projectile-mode +1)

