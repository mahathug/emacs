;; compilation
(defun fetch-mail ()
  (interactive)
  (let ((default-directory projectile-root))
    (message "fetch mails from server")
    (compile notmuch-update)))

(defun dfu-boot ()
  (interactive)
  (let ((default-directory projectile-root))	  
    (compile dfu-cmd)))

(defun m-root()
  (interactive)
  (let ((default-directory (concat "/sudo::" projectile-root)))
    (compile m-root-compile-cmd)))

(defun um-root()
  (interactive)
  (let ((default-directory (concat "/sudo::" projectile-root)))	  
    (compile um-root-compile-cmd)))

(defun cp-image()
  (interactive)
  (let ((default-directory (concat "/sudo::" projectile-root)))
    (setq cp-image-compile-cmd (concat "sudo cp " projectile-root "/arch/arm64/boot/Image " root-dir-compile "/boot/"))
    (compile cp-image-compile-cmd)))

(defun cp-dtb()
  (interactive)
  (let ((default-directory (concat "/sudo::" projectile-root)))
    (setq cp-dtb-compile-cmd (concat "sudo cp " projectile-root "/arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb " root-dir-compile "/boot/dtb/ti/"))
    (compile cp-dtb-compile-cmd)))

(defun modules-install()
  (interactive)
  (let ((default-directory (concat "/sudo::" projectile-root)))
    (setq modules-install-compile-cmd (concat "sudo make -j16 ARCH=arm64 INSTALL_MOD_PATH=" root-dir-compile " modules_install"))
    (compile modules-install-compile-cmd)))

(defun sleep-for-n (num-of-sec)
  (interactive)
  (let ((default-directory projectile-root))	  
    (compile (concat "sleep " num-of-sec))))

(defun my-compilation-finish-function (process-name status)
  (interactive)
  (setq wait-for-completion nil)
  (message "compilation finished with %s %s" process-name status))

(setq sec 0)
(setq msec 1)

(defun synchronous-compile ()
  (interactive)
  (setq compilation-finish-functions 'my-compilation-finish-function)

  (setq wait-for-completion t)
  (r5-defconfig)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (r5-compile)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (a53-defconfig)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (a53-compile)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (cp-boot-binman-compile)
  (while wait-for-completion (sleep-for sec msec))
  
  (setq wait-for-synchronous-completion nil)

  )


(defun am62l-debug-compile ()
  (interactive)
  (make-thread (progn
  (setq compilation-finish-functions 'my-compilation-finish-function)

  (setq wait-for-completion t)
  (atf-debug-compile)
  (while wait-for-completion (sleep-for sec msec))
  
  (setq wait-for-completion t)
  (r5-defconfig)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (r5-compile)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (a53-defconfig)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (a53-compile)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (cp-boot-binman-compile)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (relay-toggle-run)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (relay-toggle-run)
  (while wait-for-completion (sleep-for sec msec))
  
  (setq wait-for-synchronous-completion nil)

  )))


(defun all-soc-compile ()
  (interactive)

  (funcall-interactively 'soc-type "1")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile)
  (while wait-for-synchronous-completion (sleep-for sec msec))

  (funcall-interactively 'soc-type "2")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile)
  (while wait-for-synchronous-completion (sleep-for sec msec))

  (funcall-interactively 'soc-type "3")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile)
  (while wait-for-synchronous-completion (sleep-for sec msec))
  (setq wait-for-all-soc-compile nil)
  )

(defun all-compile-no-thread ()
  (interactive)
  (funcall-interactively 'device-type "1")
  (setq wait-for-all-soc-compile t)
  (all-soc-compile)
  (while wait-for-all-soc-compile (sleep-for sec msec))

  (funcall-interactively 'device-type "2")
  (setq wait-for-all-soc-compile t)
  (all-soc-compile)
  (while wait-for-all-soc-compile (sleep-for sec msec))
  
  (funcall-interactively 'device-type "3")
  (setq wait-for-all-soc-compile t)
  (all-soc-compile)
  (while wait-for-all-soc-compile (sleep-for sec msec))
  )

(defun all-compile()
  (interactive)
  (make-thread 'all-compile-no-thread))

(defun relay-toggle-run ()
  (interactive)
  (let ((default-directory projectile-root))	  
    (compile relay-toggle-cmd)))

(defun relay-off ()
  (interactive)
  (let ((default-directory projectile-root))	  
    (compile relay-off-cmd)))

(defun relay-on ()
  (interactive)
  (let ((default-directory projectile-root))	  
    (compile relay-on-cmd)))

(defun relay-reset()
  (interactive)
  (setq compilation-finish-functions 'my-compilation-finish-function)

  (setq wait-for-completion t)
  (relay-off)
  (while wait-for-completion (sleep-for 3 msec))

  (setq wait-for-completion t)
  (relay-on)
  (while wait-for-completion (sleep-for sec msec))
  
  (setq wait-for-synchronous-completion nil)

  )

