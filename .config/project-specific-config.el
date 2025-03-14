(load "am62l.el")

(defun my-projectile-compile-commands ()
  "Set project-specific compile command using Projectile."
  (interactive)
  (message "project-detected %s" (projectile-project-root))
  (when (projectile-project-root) ;; Ensure we are in a Projectile project
    (let ((proj-root (projectile-project-root)))
      (setq projectile-root proj-root)
      (cond
       ((string-match "trusted" proj-root)
	(message "trusted")
	(setq-local projectile-project-compilation-cmd atf-make-cmd))
       ((string-match "tee" proj-root)
	(message "tee")
	(setq-local projectile-project-compilation-cmd optee-make-cmd))
       ((string-match "boot" proj-root)
	(message "uboot")
	(setq-local projectile-project-configure-cmd uboot-configure-cmd)
	(setq-local projectile-project-compilation-cmd uboot-make-cmd)
	(setq-local projectile-project-run-cmd uboot-run-cmd))
       ((string-match "linux" proj-root)
	(message "linux")
	(setq-local projectile-project-configure-cmd kernel-configure-cmd)
	(setq-local projectile-project-compilation-cmd kernel-make-cmd)
       	(setq-local projectile-project-install-cmd kernel-modules-install-cmd))
       (t
	(message "all")
	(setq-local projectile-project-compilation-cmd "make")))))) ;; Default fallback

(add-hook 'projectile-after-switch-project-hook #'my-projectile-compile-commands)
