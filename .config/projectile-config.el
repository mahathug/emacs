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

(defun projectile-add-search-path (path)
  "Add PATH to projectile-project-search-path permanently.
If PATH already exists in the list, it is not added again.
Updates both the in-memory list and the config file."
  (interactive "DAdd project search path: ")
  (if (member path projectile-project-search-path)
      (message "%s already exists in projectile-project-search-path" path)
    ;; Add to in-memory list
    (setq projectile-project-search-path
          (append projectile-project-search-path (list path)))
    ;; Anchor on (define-key which always follows the setq list
    (let ((config-file (expand-file-name "~/.emacs.d/.config/projectile-config.el")))
      (with-temp-buffer
        (insert-file-contents config-file)
        (if (search-forward "\n(define-key projectile-mode-map" nil t)
            (progn
              (beginning-of-line)
              (backward-char 1)
              (let ((eol (point)))
                (goto-char eol)
                (if (search-backward "))" (line-beginning-position) t)
                    (progn
                      (insert (format "\n                                        %S" path))
                      (write-region (point-min) (point-max) config-file))
                  (message "Could not find )) in closing line"))))
          (message "Could not find anchor in config file"))))
    (message "Added '%s' to projectile-project-search-path" path)))

(setq projectile-project-search-path '("~/.emacs.d/"
				       "~/best-practice/"
				       "~/cryptohub/"
				       "/system-firmware/"
				       "/.emacs.d/gemini/"
				       "~/attack-udero/"
				       "~/openssf/"
				       "~/rust/"
				       "~/best-practice/cip-project/cip-core/isar-cip-core"
				       "~/cra/"
				       "~/cip-projects/isar-cip-core"
                                        "~/am62/binman/cryptodev-2.6"
                                        "~/am62/binman/linux-next-upstream"
                                        "~/am62/binman/u-boot"
                                        "~/ti-processor-sdk-linux-am62lxx-evm-11.00.15.05"
                                        "~/ti-processor-sdk-linux-am62xx-evm-11.00.09.04"
                                        "~/am62/binman/processor-sdk-doc"
					"~/am62/binman/optee_projects/optee"
					"~/am62/binman/rm_pm_hal"
					"~/sdk-yocto"
				        "~/am62/binman/optee_projects/optee_qemu_master/ftpm-rs/"
					("~/am62/binman/optee_projects/" . 2) ;;
                                        ("~/am62/binman/am62l-wakeup/" . 1)
                                        "~/trusted-firmware-cve/"))
(define-key projectile-mode-map (kbd "M-e") 'projectile-command-map)
(define-key projectile-mode-map (kbd "M-a") 'projectile-commander)
(projectile-mode +1)
