;; compilation
(defun git-info ()
  (interactive)
  (let ((default-directory work_dir_1))	  
    (compile (concat "echo u-boot >> 1.info && git -C u-boot/ log -1 --oneline >> 1.info"
		     " && "
		     "echo ti-linux-firmware >> 1.info && git -C ti-linux-firmware/ log -1 --oneline >> 1.info"
		     " && "
		     "echo optee_os >> 1.info && git -C optee_os/ log -1 --oneline >> 1.info"
		     " && "
		     "echo arm-trusted-firmware >> 1.info && git -C arm-trusted-firmware/ log -1 --oneline >> 1.info"
		     ))))

(defun fetch-mail ()
  (interactive)
  (let ((default-directory work_dir_1))
    (message "fetch mails from server")
    (compile notmuch-update)))

(defun dfu-boot ()
  (interactive)
  (let ((default-directory work_dir_2))	  
    (compile dfu-cmd)))

(defun r5-clean ()
  (interactive)
  (let ((default-directory work_dir_2))	  
    (compile (concat    r5-base-make-cmd "clean " r5-set-out-dir))))

(defun r5-defconfig ()
  (interactive)
  (let ((default-directory work_dir_2))
    (message "r5-defconfig")
    (compile r5-defconfig-cmd)))

(defun r5-mmc-defconfig ()
  (interactive)
  (let ((default-directory work_dir_2))
    (message "r5-mmc-defconfig")
    (compile r5-mmc-defconfig-cmd)))

(defun r5-usbdfu-defconfig ()
  (interactive)
  (let ((default-directory work_dir_2))
    (compile r5-usbdfu-defconfig-cmd)))

(defun r5-ethboot-defconfig ()
  (interactive)
  (let ((default-directory work_dir_2))
    (compile r5-ethboot-defconfig-cmd)))

(defun r5-compile ()
  (interactive)
  (let ((default-directory work_dir_2))
    (message "r5-compile")
    (compile r5-make-cmd)))

(defun atf-compile ()
  (interactive)
  (let ((default-directory work_dir_9))
    (message "atf-compile")
    (compile (concat atf-make-cmd " && " atf-copy-cmd))))

(defun atf-info-compile ()
  (interactive)
  (let ((default-directory work_dir_9))
    (message "atf-info-compile")
    (compile (concat atf-make-cmd " LOG_LEVEL=40 " " && " atf-copy-cmd))))

(defun atf-verbose-compile ()
  (interactive)
  (let ((default-directory work_dir_9))
    (message "atf-info-compile")
    (compile (concat atf-make-cmd " LOG_LEVEL=50 " " && " atf-copy-cmd))))


(defun atf-debug-compile ()
  (interactive)
  (let ((default-directory work_dir_9))
    (message "atf-debug-compile")
    (compile (concat atf-make-cmd " DEBUG=1 LOG_LEVEL=40 " " && " atf-debug-copy-cmd))))

(defun atf-debug-am64-compile ()
  (interactive)
  (let ((default-directory work_dir_9))
    (message "atf-debug-compile")
    (compile (concat atf-make-cmd " DEBUG=1 " " && " atf-debug-copy-cmd))))


(defun atf-copy ()
  (interactive)
  (let ((default-directory work_dir_9))
    (message "atf-copy")
    (compile atf-copy-cmd)))


(defun cp-boot-binman-compile ()
  (interactive)
  (let ((default-directory work_dir_2))
    (message "cp-boot-binman-compile")
    (compile cp-binman-boot-to-all-builds-cmd)))

(defun cp-boot-kig-compile ()
  (interactive)
  (let ((default-directory work_dir_2))
    (message "cp-boot-kig-compile")
    (compile cp-kig-boot-to-all-builds-cmd)))

(defun r5-binman-compile ()
  (interactive)
  (let ((default-directory work_dir_2))
    (compile r5-binman-compile)))

(defun a53-binman-compile ()
  (interactive)
  (let ((default-directory work_dir_2))
    (compile a53-binman-make-cmd)))

(defun a53-clean ()
  (interactive)
  (let ((default-directory work_dir_2))	  
    (compile (concat    a53-base-make-cmd "clean"))))	

(defun a53-defconfig ()
  (interactive)
  (let ((default-directory work_dir_2))
    (message "a53-defconfig")
    (compile (concat  a53-defconfig-cmd))))

(defun a53-compile ()
  (interactive)
  (let ((default-directory work_dir_2))
    (message "a53-compile")
    (compile (concat  a53-make-cmd)))
  )

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


(defun synchronous-compile-kig ()
  (interactive)
  (setq compilation-finish-functions 'my-compilation-finish-function)

  (setq wait-for-completion t)
  (r5-defconfig)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (r5-compile)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (kig-compile)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (a53-defconfig)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (a53-compile)
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (cp-boot-kig-compile)
  (while wait-for-completion (sleep-for sec msec))
  
  (setq wait-for-synchronous-completion nil)

  )

(defun am62l-info-compile ()
  (interactive)
  (setq compilation-finish-functions 'my-compilation-finish-function)

  (setq wait-for-completion t)
  (atf-info-compile)
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


(defun all-device-compile ()
  (interactive)

  (funcall-interactively 'device-type "1")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile)
  (while wait-for-synchronous-completion (sleep-for sec msec))
  
  (funcall-interactively 'device-type "2")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile)
  (while wait-for-synchronous-completion (sleep-for sec msec))

  (funcall-interactively 'device-type "3")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile)
  (while wait-for-synchronous-completion (sleep-for sec msec))

  (funcall-interactively 'device-type "4")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile)
  (while wait-for-synchronous-completion (sleep-for sec msec))
  
  )

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

(defun all-device-compile-kig ()
  (interactive)

  (funcall-interactively 'device-type "1")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile-kig)
  (while wait-for-synchronous-completion (sleep-for sec msec))
  
  (funcall-interactively 'device-type "2")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile-kig)
  (while wait-for-synchronous-completion (sleep-for sec msec))

  (funcall-interactively 'device-type "3")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile-kig)
  (while wait-for-synchronous-completion (sleep-for sec msec))
  )

(defun all-soc-compile-kig ()
  (interactive)

  (funcall-interactively 'soc-type "1")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile-kig)
  (while wait-for-synchronous-completion (sleep-for sec msec))

  (funcall-interactively 'soc-type "2")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile-kig)
  (while wait-for-synchronous-completion (sleep-for sec msec))

  (funcall-interactively 'soc-type "3")
  (setq wait-for-synchronous-completion t)
  (synchronous-compile-kig)
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

(defun kig-clean ()
  (interactive)
  (let ((default-directory work_dir_4))
    (compile (concat  make-clean ))))

(defun kig-compile ()
  (interactive)
  (let ((default-directory work_dir_4))
    (compile (concat  kig-make-cmd))))

(defun kig-cc ()
  (interactive)
  (let ((default-directory work_dir_4))
    (compile (concat  make-clean kig-make-cmd))))


(defun optee-compile ()
  (interactive)
  (let ((default-directory work_dir_7))	  
    (compile (concat optee-base-make-cmd "CROSS_COMPILE64=aarch64-none-linux-gnu- PLATFORM=k3-am62x CFG_ARM64_core=y CFG_TEE_CORE_LOG_LEVEL=2 CFG_TEE_CORE_DEBUG=y" " && cp out/arm-plat-k3/core/tee-pager_v2.bin " work_dir_2 "/" device "/bl32.bin" ))))

(defun optee-compile-64x ()
  (interactive)
  (let ((default-directory work_dir_7))	  
    (compile (concat optee-base-make-cmd "CROSS_COMPILE64=aarch64-none-linux-gnu- PLATFORM=k3-am64x CFG_ARM64_core=y CFG_TEE_CORE_LOG_LEVEL=2 CFG_TEE_CORE_DEBUG=y" " && cp out/arm-plat-k3/core/tee-pager_v2.bin " work_dir_2 "/" device "/bl32.bin" ))))
;;
    ;; (compile (concat "make -j8 CROSS_COMPILE=arm-none-linux-gnueabihf- CROSS_COMPILE64=aarch64-none-linux-gnu- PLATFORM=k3-am64x CFG_ARM64_core=y CFG_TEE_CORE_LOG_LEVEL=1 " " && cp out/arm-plat-k3/core/tee-pager_v2.bin " work_dir_2 "/" device "/bl32.bin")))) ;;
     ;; (compile (concat "make -j8 CROSS_COMPILE=arm-none-linux-gnueabihf- CROSS_COMPILE64=aarch64-none-linux-gnu- PLATFORM=k3-am64x CFG_ARM64_core=y " " && cp out/arm-plat-k3/core/tee-pager_v2.bin " work_dir_2 "/" device "/bl32.bin"))))

(defun optee-compile-swrng ()
  (interactive)
  (let ((default-directory work_dir_7))	  
    (compile (concat   optee-base-make-cmd "CROSS_COMPILE64=aarch64-none-linux-gnu- PLATFORM=k3-am62x CFG_ARM64_core=y  CFG_WITH_SOFTWARE_PRNG=y" " && cp out/arm-plat-k3/core/tee-pager_v2.bin " work_dir_2 "/" device "/bl32.bin" ))))
;; CFG_TEE_CORE_LOG_LEVEL=2 CFG_TEE_CORE_DEBUG=y ;;
(defun modules-compile ()
  (interactive)
  (let ((default-directory work_dir_3))
    (compile (concat kernel-base-make-cmd "modules"))))

(defun kernel-compile ()
  (interactive)
  (let ((default-directory work_dir_3))
    (compile (concat kernel-base-make-cmd "Image"))))

(defun kernel-defconfig ()
  (interactive)
  (let ((default-directory work_dir_3))
    (compile (concat kernel-base-make-cmd "tisdk_" device "-evm_defconfig"))))

(defun relay-toggle-run ()
  (interactive)
  (let ((default-directory work_dir_1))	  
    (compile relay-toggle-cmd)))

(defun am62-relay ()
  (interactive)
  (setq compilation-finish-functions 'my-compilation-finish-function)

  (setq wait-for-completion t)
  (relay-toggle-run)
  (while wait-for-completion (sleep-for 3 msec))

  (setq wait-for-completion t)
  (relay-toggle-run)
  (while wait-for-completion (sleep-for sec msec))
  
  (setq wait-for-synchronous-completion nil)

  )



