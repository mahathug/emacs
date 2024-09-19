(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(comment-multi-line t)
 '(comment-style 'aligned)
 '(custom-enabled-themes '(misterioso))
 '(enable-recursive-minibuffers t)
 '(inhibit-startup-screen t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(ispell-dictionary nil)
 '(notmuch-saved-searches
   '((:name "lpr" :query "tag:ti-linux-patch-review" :key "l" :sort-order newest-first)
     (:name "uboot" :query "tag:uboot" :key "u" :sort-order newest-first)
     (:name "tbr" :query "tag:tiL-tbr" :key "t" :sort-order newest-first)
     (:name "reviewed" :query "tag:tiL-reviewed" :key "r" :sort-order newest-first)
     (:name "meta-ti" :query "tag:meta-ti" :key "m" :sort-order newest-first)
     (:name "tiL-5.10" :query "tag:tiL-5.10" :key "5" :sort-order newest-first)
     (:name "tiU21" :query "tag:tiU21" :key "2" :sort-order newest-first)
     (:name "Inbox" :query "tag:Inbox" :key "i" :sort-order newest-first)
     (:name "direct" :query "tag:direct" :key "d" :sort-order newest-first)
     (:name "all mail" :query "*" :key "a" :sort-order newest-first)))
 '(package-selected-packages
   '(which-key realgud mailscripts smart-tab smart-tabs-mode highlight highlight-80+ counsel mutt-mode visual-regexp visual-regexp-steroids bash-completion docker-tramp docker sr-speedbar xcscope vala-mode use-package solarized-theme paredit multi-term magit expand-region dired-single auto-complete))
 '(safe-local-variable-values
   '((c-offsets-alist
      (arglist-close . c-lineup-arglist-tabs-only)
      (arglist-cont-nonempty c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only)
      (arglist-intro . +)
      (brace-list-intro . +)
      (c . c-lineup-C-comments)
      (case-label . 0)
      (comment-intro . c-lineup-comment)
      (cpp-define-intro . +)
      (cpp-macro . -1000)
      (cpp-macro-cont . +)
      (defun-block-intro . +)
      (else-clause . 0)
      (func-decl-cont . +)
      (inclass . +)
      (inher-cont . c-lineup-multi-inher)
      (knr-argdecl-intro . 0)
      (label . -1000)
      (statement . 0)
      (statement-block-intro . +)
      (statement-case-intro . +)
      (statement-cont . +)
      (substatement . +))
     (c-label-minimum-indentation . 0)))
 '(speedbar-visiting-file-hook
   '(sr-speedbar-visiting-file-hook
     (lambda nil
       (other-window 1))))
 '(term-default-fg-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-current-diff-A ((t (:foreground "black" :background "brown"))))
 '(ediff-current-diff-B ((t (:foreground "black" :background "green"))))
 '(ediff-current-diff-C ((t (:foreground "White" :background "orange"))))
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-section-highlight ((((type tty)) nil)))
 '(speedbar-tag-face ((t (:foreground "brown"))))
 '(term ((t (:inherit nil))))
 '(term-color-black ((t (:background "light gray" :foreground "light gray"))))
 '(term-color-blue ((t (:background "cornflower blue" :foreground "cornflower blue"))))
 '(term-color-green ((t (:background "light sea green" :foreground "light sea green"))))
 '(term-color-magenta ((t (:background "dark magenta" :foreground "dark magenta"))))
 '(term-color-red ((t (:background "indian red" :foreground "indian red"))))
 '(term-color-white ((t (:background "white smoke" :foreground "white smoke"))))
 '(term-color-yellow ((t (:background "goldenrod" :foreground "goldenrod")))))

;; follow sym-link ;;
(setq vc-follow-symlinks t)

;; working directory setup
(defun ti-setup ()
  (interactive )

  (defun default-path-setup()
    (interactive )  
    
    (setq ti-u-boot "ti-u-boot")
    (setq ti-kernel "ti-linux-kernel")
    (setq ti-kig "k3-image-gen")
    (setq ti-optee "optee_os")
    (setq ti-meta-ti "meta-ti")
    (setq u-boot "u-boot")
    (setq linux "linux-next")
    (setq atf "trusted-firmware-a")
    (setq crypto-upstream "cryptodev-2.6")
    ;; (setq working-project-path nil) ;;
    (setq am62x "am62x")
    (setq am62ax "am62ax")
    (setq am64x "am64x")
    (setq am62x_lpsk "am62x_lpsk")
    (setq am65x "am65x")
    (setq am62l "am62l")
    (setq mainline "mainline")
    (setq ti "ti")
    


    (setq boot-dir-debian "/media/kamlesh/BOOT")
    (setq boot-dir-sdk "/media/kamlesh/boot")
    (setq root-dir-debian "/media/kamlesh/rootfs/")
    (setq root-dir-sdk "/media/kamlesh/root/")
    (setq boot-node "/dev/sdd1")
    (setq root-node "/dev/sdd2")
    (setq relay-number-am62x "1")
    (setq relay-number-am64x "3")
    (setq all-builds-dir "~/all-builds")
    
    (setq boot-dir boot-dir-sdk)
    (setq root-dir root-dir-sdk)
    )

  (defun default-cmd-setup()
    (interactive )  
    (defvar soc-type "hs-fs")
    (defvar sign-type "binman")
    (defvar device am62x)
    (defvar source ti)
    (defvar boot-type "mmc")
    )

  
  (default-path-setup)
  (default-cmd-setup)

  (defun path-setup ()
    (interactive )
    
    (setq ti-u-boot-path (concat working-project-path ti-u-boot))
    (setq ti-kernel-path (concat working-project-path ti-kernel))
    (setq ti-kig-path (concat working-project-path ti-kig))
    (setq ti-optee-path (concat working-project-path ti-optee))
    (setq ti-meta-ti-path (concat working-project-path ti-meta-ti))
    (setq u-boot-path (concat working-project-path u-boot))
    (setq linux-path (concat working-project-path linux))
    (setq atf-path (concat working-project-path atf))
    (setq crypto-upstream-path (concat working-project-path crypto-upstream))
    
    (setq work_dir_1 working-project-path)
    (setq work_dir_4 ti-kig-path)
    (setq work_dir_7 ti-optee-path)
    (setq work_dir_8 ti-meta-ti-path)
    (setq work_dir_5 u-boot-path)
    (setq work_dir_6 linux-path)
    (setq work_dir_9 atf-path)
    (setq work_dir_10 (concat working-project-path crypto-upstream))
    ;; (setq remote_work_dir_3 "/ssh:debian@10.24.69.197:~/") ;;
    (setq remote_work_dir_3 "/ssh:root@10.24.68.193:~/") ;;
    ;; (setq remote_work_dir_3 "/ssh:a0501066@sshgw.dal.design.ti.com:~/") ;;
    
    (cond
     ((string= device am62x)
      (progn
	(message "Device is am62x")
	(setq device am62x)))
     ((string= device am62x_lpsk)
      (progn
	(message "Device is am62x_lpsk")
	(setq device am62x_lpsk)))
     ((string= device am62ax)
      (progn
	(message "Device is am62ax")
	(setq device am62ax)))	    
     ((string= device am64x)
      (progn
	(message "Device is am64x")
	(setq device am64x)))
     ((string= device am64x)
      (progn
	(message "Device is am65x")
	(setq device am65x)))
     )

    (setq r5-mmc-defconfig (concat device "_evm_r5_defconfig"))
    (setq r5-usbdfu-defconfig (concat device "_evm_r5_usbdfu_defconfig"))
    (setq r5-ethboot-defconfig (concat device "_evm_r5_ethboot_defconfig"))
    (setq a53-gp-defconfig (concat device "_evm_a53_defconfig"))
    
    (cond
     ((string= source mainline)
      (progn
	(message "Source is mainline")
	(setq work_dir_2 u-boot-path)        ;;
	(setq u-boot-type u-boot)
	(setq work_dir_3 linux-path)
	;; (setq work_dir_5 ti-u-boot-path)	   ;;
	))
     ((string= source ti)
      (progn
	(message "Source is ti")
	(setq work_dir_2 ti-u-boot-path)
	(setq u-boot-type ti-u-boot)
	(setq work_dir_3 ti-kernel-path)
	)
      )
     )
    )
  
  (defun cmd-setup ()
    (interactive )

    ;; (setq hsse-env "cd ./ ") ;;
    (setq hsse-env "cd ./ ")
    ;; (setq hsse-env "export PATH=$HOME/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin:$PATH && export PATH=$HOME/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/bin:$PATH && export TI_SECURE_DEV_PKG=/home/kamlesh/core-secdev-k3") ;;
    ;; (setq hs-fs-env "export PATH=$HOME/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin:$PATH && export PATH=$HOME/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/bin:$PATH && export TI_SECURE_DEV_PKG=/home/kamlesh/core-secdev-k3") ;;

    (setq r5-base-make-cmd " make -j32 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabihf- ")
    (setq a53-base-make-cmd " make -j32 ARCH=arm CROSS_COMPILE=aarch64-none-linux-gnu- ")
    (setq kernel-base-make-cmd " make -j32 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- ")
    (setq optee-base-make-cmd " make -j32 CROSS_COMPILE=arm-none-linux-gnueabihf- ")
    ;; (setq atf-base-make-cmd " make ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=lite  clean && make ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=lite ") ;; ;; ;;
    (setq atf-base-make-cmd " make ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=lite SPD=opteed clean && make ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=lite SPD=opteed ") ;; ;; ;;
        ;; (setq atf-base-make-cmd " make ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=lite SPD=opteed clean && make ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=lite SPD=opteed ") ;; ;;
    
    (cond
     ((string= device am65x)    (setq atf-base-make-cmd " make ARCH=aarch64 CROSS_COMPILE=aarch64-linux-gnu- PLAT=k3 TARGET_BOARD=generic SPD=opteed clean && make ARCH=aarch64 CROSS_COMPILE=aarch64-linux-gnu- PLAT=k3 TARGET_BOARD=generic SPD=opteed ")))
    (setq r5-out-dir (concat "out/" sign-type "/"  device "/" soc-type "/r5"))
    (setq a53-out-dir (concat "out/" sign-type "/" device "/" soc-type "/a53"))
    (setq r5-set-out-dir (concat " O=" r5-out-dir))
    (setq a53-set-out-dir (concat " O=" a53-out-dir))

    (setq atf-unsigned (concat " ATF=../../../../../" device "/bl31.bin "))
    (setq atf-signed (concat " ATF=../../../../../" device "/bl31.bin "))
    (setq optee-unsigned (concat " TEE=../../../../../" device "/bl32.bin "))
    (setq optee-signed (concat " TEE=../../../../../" device "/bl32.bin "))
    ;; (setq dm-unsigned (concat " DM=../../../../../" device "/ipc_echo_testb_mcu1_0_release_strip.xer5f.unsigned ")) ;;
    (setq dm-signed (concat " DM=../../../../../../ti-linux-firmware/ti-dm/" device "x/ipc_echo_testb_mcu1_0_release_strip.xer5f.signed "))
    
    (cond
     ((string= device am62x)
      (progn
	;; (message "Device is am62x") ;;
	nil))
     ((string= device am62x_lpsk)
      (progn
	(setq r5-mmc-defconfig (concat device "_r5_defconfig"))
	(setq r5-usbdfu-defconfig (concat device "_r5_usbdfu_defconfig"))
	(setq a53-gp-defconfig (concat device "_a53_defconfig"))
	nil))
     ((string= device am62ax)
      (progn
	;; (message "Device is am62ax") ;;
	nil))
     ((string= device am64x)
      (progn
	;; (message "Device is am64x") ;;
	(setq dm-unsigned " ")
	(setq dm-signed "  ")
	))
     )


    (setq soc (concat " SOC=" device " "))
    (cond ((string= device am64x) (setq soc (concat " SOC=" device "_sr2 "))))
    (setq sbl (concat  " SBL=" work_dir_2 "/" r5-out-dir "/spl/u-boot-spl.bin"))
    
    (setq soc-type-hs " SOC_TYPE=hs ")
    (setq soc-type-hs-fs " SOC_TYPE=hs-fs ")
    (setq sysfw-dir (concat " SYSFW_DIR=" work_dir_1 "/ti-linux-firmware/ti-sysfw/ "))
    (setq make-clean " && make -j16 clean")

    (setq r5-mmc-defconfig-cmd (concat r5-base-make-cmd r5-mmc-defconfig r5-set-out-dir ))
    (setq r5-usbdfu-defconfig-cmd (concat  r5-base-make-cmd r5-usbdfu-defconfig r5-set-out-dir))
    (setq r5-ethboot-defconfig-cmd (concat    r5-base-make-cmd r5-ethboot-defconfig r5-set-out-dir))
    
    (setq a53-defconfig-cmd  (concat  a53-base-make-cmd a53-gp-defconfig a53-set-out-dir))
    
    (setq a53-gp-make-cmd (concat  a53-base-make-cmd atf-signed optee-signed dm-signed a53-set-out-dir))
    (setq a53-hs-make-cmd (concat  a53-base-make-cmd atf-signed optee-signed dm-signed a53-set-out-dir))
    (setq r5-make-cmd-kig (concat   r5-base-make-cmd r5-set-out-dir))
    
    (setq a53-make-cmd-kig a53-hs-make-cmd)
    ;; (setq kig-hs-fs-make-cmd (concat " ; " r5-base-make-cmd soc soc-type-hs-fs sbl sysfw-dir)) ;;
    ;; (setq kig-make-cmd kig-hs-fs-make-cmd) ;;


    (setq r5-make-cmd r5-make-cmd-kig)
    (setq  a53-make-cmd a53-make-cmd-kig)

    (setq atf-make-cmd (concat  atf-base-make-cmd))
    (setq atf-copy-cmd (concat "cp " "build/k3/lite/release/bl31.bin" " " work_dir_2 "/" device "/bl31.bin"))
    (setq atf-debug-copy-cmd (concat "cp " "build/k3/lite/debug/bl31.bin" " " work_dir_2 "/" device "/bl31.bin"))
    (cond
     ((string= device am65x) (progn
			       (setq atf-copy-cmd (concat "cp " "build/k3/generic/release/bl31.bin" " " work_dir_2 "/" device "/bl31.bin"))
			       (setq atf-debug-copy-cmd (concat "cp " "build/k3/generic/debug/bl31.bin" " " work_dir_2 "/" device "/bl31.bin"))
			       )))
    
    (cond
     (
      (string= soc-type "hs")
      (progn
	;; (setq a53-make-cmd-kig a53-hs-make-cmd)	    ;;
	(setq a53-make-cmd-kig a53-hs-make-cmd)
	(setq r5-make-cmd-kig r5-make-cmd-kig)
	(setq kig-hs-make-cmd (concat " ; " r5-base-make-cmd soc soc-type-hs sbl sysfw-dir))
	(setq kig-make-cmd-kig kig-hs-make-cmd)
	)
      )
     (
      (string= soc-type "hs-fs")
      (progn
	;; (setq a53-make-cmd-kig a53-hs-make-cmd)	    ;;
	(setq a53-make-cmd-kig a53-hs-make-cmd)
	(setq r5-make-cmd-kig r5-make-cmd-kig)
	(setq kig-hs-fs-make-cmd (concat " ; " r5-base-make-cmd soc soc-type-hs-fs sbl sysfw-dir))
	(setq kig-make-cmd-kig kig-hs-fs-make-cmd)
	)
      )
     (
      (string= soc-type "gp")
      (progn
	;; (setq a53-make-cmd-kig a53-gp-make-cmd)	    ;;
	(setq a53-make-cmd-kig a53-gp-make-cmd)
	(setq r5-make-cmd-kig r5-make-cmd-kig)
	(setq kig-gp-make-cmd (concat " ; " r5-base-make-cmd soc sbl sysfw-dir))
	(setq kig-make-cmd-kig kig-gp-make-cmd)
	)
      )
     )
    
    (cond
     (
      (string= sign-type "kig")
      (progn
	(setq r5-make-cmd r5-make-cmd-kig)
	(setq a53-make-cmd a53-make-cmd-kig)
	(setq kig-make-cmd kig-make-cmd-kig)
	)
      )
     (
      (string= sign-type "binman")
      (progn
    	(setq bl31-unsigned (concat " BL31=../../../../../" device "/bl31.bin "))
	(setq ti-linux-firmware-set " BINMAN_INDIRS=../../../../../../ti-linux-firmware/ ")
	(setq r5-make-cmd-binman (concat r5-base-make-cmd ti-linux-firmware-set r5-set-out-dir))
	(setq a53-make-cmd-binman (concat a53-base-make-cmd bl31-unsigned optee-unsigned ti-linux-firmware-set a53-set-out-dir))
	(setq r5-make-cmd r5-make-cmd-binman)
	(setq a53-make-cmd a53-make-cmd-binman)
	)
      )
     )

    (cond
     (
      (string= boot-type "mmc")
      (progn
	(setq r5-defconfig-cmd r5-mmc-defconfig-cmd)
	)
      )
     (
      (string= boot-type "dfu")
      (progn
	(setq r5-defconfig-cmd r5-usbdfu-defconfig-cmd)
	)
      )
     )
    

    (defun soc-type (soc-type-input)
      "Prompt user for soc-type"
      (interactive "sEnter soc-type-input: 1 for hs, 2 for hs-fs, 3 for gp")
      (cond
       (
	(string= soc-type-input "1")
	(progn
	  (setq soc-type "hs")	
	  )
	)
       (
	(string= soc-type-input "2")
	(progn
	  (setq soc-type "hs-fs")	
	  )
	)
       (
	(string= soc-type-input "3")
	(progn
	  (setq soc-type "gp")
	  )
	)
       )
      (message "soc type is %s" soc-type)
      (ti-setup)
      )
    
    (defun sign-type(sign-type-input)
      "Prompt user for sign-type"
      (interactive "sEnter sign-type-input, k for kig, b for binman:")
      (cond
       (
	(string= sign-type-input "k")
	(progn
	  (setq sign-type "kig")
	  )
	)
       (
	(string= sign-type-input "b")
	(progn
	  (setq sign-type "binman")
	  )
	)
       )
      (message "sign type is %s" sign-type)
      (ti-setup)
      )

    (defun device-type(device-type-input)
      "Prompt user for device-type"
      (interactive "sEnter device-type-input, 1 for am62, 2 for am62a, 3 for am64, 4 for am62-lp, 5 for am65x:")
      (cond
       (
	(string= device-type-input "1")
	(progn
	  (setq device am62x)
	  )
	)
       (
	(string= device-type-input "2")
	(progn
	  (setq device am62ax)
	  )
	)
       (
	(string= device-type-input "3")
	(progn
	  (setq device am64x)
	  )
	)
       (
	(string= device-type-input "4")
	(progn
	  (setq device am62x_lpsk)
	  )
	)
       (
	(string= device-type-input "5")
	(progn
	  (setq device am65x)
	  )
	)
       )
      (message "device type is %s" device)
      (ti-setup)
      )

    (defun source-type(source-type-input)
      "Prompt user for source-type"
      (interactive "sEnter source-type-input, m for mainline, t for ti:")
      (cond
       (
	(string= source-type-input "m")
	(progn
	  (setq source "mainline")
	  )
	)
       (
	(string= source-type-input "t")
	(progn
	  (setq source"ti")
	  )
	)
       )
      (message "source type is %s" source)
      (ti-setup)
      )
    
    (defun boot-type(boot-type-input)
      "Prompt user for boot-type"
      (interactive "sEnter boot-type-input, d for dfu, m for mmc/uart:")
      (cond
       (
	(string= boot-type-input "m")
	(progn
	  (setq boot-type "mmc")
	  )
	)
       (
	(string= boot-type-input "d")
	(progn
	  (setq boot-type "dfu")
	  )
	)
       )
      (message "boot type is %s" boot-type)
      (ti-setup)
      )
    )
  
  
  (path-setup)
  (cmd-setup)
  (message "%s %s %s %s %s" device soc-type source sign-type boot-type)
  (dir-locals-set-directory-class
   (expand-file-name work_dir_3)
   'linux-kernel)
  
  (setq bookmark-default-file (concat work_dir_1 "bookmarks"))
  ;; (shell-working-dir) ;;
  ;; (shell-pico) ;;
  (shortcuts-after-setup)

  (defun cp-cmd-setup()
    (interactive)
    (setq all-builds-dev-dir (concat all-builds-dir "/" device))
    (setq all-builds-dev-hs-dir (concat all-builds-dev-dir "/" soc-type))
    (setq all-builds-dev-hs-fs-dir (concat all-builds-dev-dir "/" soc-type))
    (setq all-builds-dev-gp-dir (concat all-builds-dev-dir "/" soc-type))
    (setq tiboot3 (concat "tiboot3-" device "-" soc-type "-" "evm.bin"))
    (cond ((and (string= device am64x)  (not (string= soc-type "gp")) ) (setq tiboot3 (concat "tiboot3-" device "_sr2" "-" soc-type "-" "evm.bin"))))
    (cond ((and (string= device am65x) (setq tiboot3 (concat "tiboot3-" device "_sr2" "-" soc-type "-" "evm.bin")))))
    (cond ((string= device am62x_lpsk)  (setq tiboot3 (concat "tiboot3-" am62x "-" soc-type "-" "evm.bin"))))
    (setq cp-binman-boot-to-all-builds-cmd-hs (concat "cp " work_dir_2 "/" r5-out-dir "/" tiboot3 " " all-builds-dev-hs-dir "/tiboot3.bin && cp " work_dir_2 "/" a53-out-dir "/tispl.bin " all-builds-dev-hs-dir "/tispl.bin && cp " work_dir_2 "/" a53-out-dir "/u-boot.img " all-builds-dev-hs-dir "/u-boot.img"))

    ;; (setq cp-binman-boot-to-all-builds-cmd-hs-fs (concat "cp " work_dir_2 "/" r5-out-dir "/" tiboot3 " " all-builds-dev-hs-fs-dir "/tiboot3.bin && cp " work_dir_2 "/" a53-out-dir "/tispl.bin_unsigned " all-builds-dev-hs-fs-dir "/tispl.bin && cp " work_dir_2 "/" a53-out-dir "/u-boot.img " all-builds-dev-hs-fs-dir "/u-boot.img"))

        (setq cp-binman-boot-to-all-builds-cmd-hs-fs (concat "cp " work_dir_2 "/" r5-out-dir "/" tiboot3 " " all-builds-dev-hs-fs-dir "/tiboot3.bin && cp " work_dir_2 "/" a53-out-dir "/tispl.bin " all-builds-dev-hs-fs-dir "/tispl.bin && cp " work_dir_2 "/" a53-out-dir "/u-boot.img " all-builds-dev-hs-fs-dir "/u-boot.img"))


    (setq cp-binman-boot-to-all-builds-cmd-gp (concat "cp " work_dir_2 "/" r5-out-dir "/" tiboot3 " " all-builds-dev-gp-dir "/tiboot3.bin && cp " work_dir_2 "/" a53-out-dir "/tispl.bin_unsigned " all-builds-dev-gp-dir "/tispl.bin && cp " work_dir_2 "/" a53-out-dir "/u-boot.img_unsigned " all-builds-dev-gp-dir "/u-boot.img"))

    (setq cp-kig-boot-to-all-builds-cmd-hs (concat "cp " work_dir_4 "/tiboot3.bin " all-builds-dev-hs-dir "/tiboot3.bin && cp " work_dir_2 "/" a53-out-dir "/tispl.bin_HS " all-builds-dev-hs-dir "/tispl.bin && cp " work_dir_2 "/" a53-out-dir "/u-boot.img_HS " all-builds-dev-hs-dir "/u-boot.img"))

    (setq cp-kig-boot-to-all-builds-cmd-hs-fs (concat "cp " work_dir_4 "/tiboot3.bin " all-builds-dev-hs-fs-dir "/tiboot3.bin && cp " work_dir_2 "/" a53-out-dir "/tispl.bin_HS " all-builds-dev-hs-fs-dir "/tispl.bin && cp " work_dir_2 "/" a53-out-dir "/u-boot.img_HS " all-builds-dev-hs-fs-dir "/u-boot.img"))

    (setq cp-kig-boot-to-all-builds-cmd-gp (concat "cp " work_dir_4 "/tiboot3.bin " all-builds-dev-gp-dir "/tiboot3.bin && cp " work_dir_2 "/" a53-out-dir "/tispl.bin " all-builds-dev-gp-dir "/tispl.bin && cp " work_dir_2 "/" a53-out-dir "/u-boot.img " all-builds-dev-gp-dir "/u-boot.img"))

    (cond
     (
      (string= soc-type "hs")
      (progn
	(setq cp-binman-boot-to-all-builds-cmd cp-binman-boot-to-all-builds-cmd-hs)
	(setq cp-kig-boot-to-all-builds-cmd  cp-kig-boot-to-all-builds-cmd-hs)
	(setq all-builds-dev-dir-generic all-builds-dev-hs-dir) 
	)
      )
     (
      (string= soc-type "hs-fs")
      (progn
	(setq cp-binman-boot-to-all-builds-cmd cp-binman-boot-to-all-builds-cmd-hs-fs)
	(setq cp-kig-boot-to-all-builds-cmd  cp-kig-boot-to-all-builds-cmd-hs-fs)
	(setq all-builds-dev-dir-generic all-builds-dev-hs-fs-dir) 
	)
      )
     (
      (string= soc-type "gp")
      (progn
	(setq cp-binman-boot-to-all-builds-cmd cp-binman-boot-to-all-builds-cmd-gp)
	(setq cp-kig-boot-to-all-builds-cmd  cp-kig-boot-to-all-builds-cmd-gp)
	(setq all-builds-dev-dir-generic all-builds-dev-gp-dir) 
	)
      )
     )

    (cond
     (    
      (string= boot-type "dfu")
      (progn
	(setq dfu-cmd (concat "cd " all-builds-dev-dir-generic " && "  " sudo dfu-util -R -a bootloader -D tiboot3.bin" " && sleep 1 && sudo dfu-util -R -a tispl.bin -D tispl.bin"   " && sleep 2 && sudo dfu-util -R  -a u-boot.img -D u-boot.img; cd -")))) 
      (t (setq dfu-cmd (concat "cd " all-builds-dev-dir-generic "-dfu" " && "  " sudo dfu-util -R -a bootloader -D tiboot3.bin" " && sleep 1 && sudo dfu-util -R -a tispl.bin -D tispl.bin"   " && sleep 2 && sudo dfu-util -R  -a u-boot.img -D u-boot.img; cd -")))
      )
    
    (setq pico-binman-cmd (concat "cd " all-builds-dev-dir-generic " && "  "export DEV=/dev/ttyUSB0 && sudo picocom -b 115200 $DEV -s \"sx tiboot3.bin\" && sudo picocom -b 115200 $DEV -s \"sb --ymodem -vv " "tispl.bin\" && sudo picocom -b 115200 $DEV -s \"sb --ymodem -vv " "u-boot.img\""))
    (setq cp-all-builds-to-mmc-cmd (concat "cp " all-builds-dev-dir-generic "/* ."))
    (setq pico-cmd pico-binman-cmd)
    )
  (cp-cmd-setup)

  (defun relay-cmd-setup()
    (interactive)
    (cond ((string= device am62x)  (setq relay-number relay-number-am62x)))
    (if (string= device am64x)  (setq relay-number relay-number-am64x)
	   (setq relay-number relay-number-am62x)
	   )
    (setq relay-toggle-cmd (concat "perl ~/relay/perl/perl_eth.pl " relay-number " && sleep 2"))
    )
  (relay-cmd-setup)
  (skeleton-setup)
  ;;mandotory fixes here

  ;; (setq comint-password-prompt-regexp eshell-password-prompt-regexp)
  )

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


(defun bdkcamp-setup()
  (interactive)
  (setq remote_login "/ssh:csdcd4@43.4.2.120")
  (setq remote_dir "/ssh:csdcd4@43.4.2.120:~/")
  (setq work_dir_1 remote_dir)
  (setq work_dir_2 (concat remote_dir "kamlesh"))
  (setq work_dir_3 (concat remote_login "|docker:camp_2.6.4-0:/workspace/kamlesh_ws"))
  (setq work_dir_4 (concat remote_login "|ssh:root@10.0.52.12:~/coordinate_issue"))
  (setq work_dir_5 "/ssh:visos@43.4.0.177:~/kamlesh")
  (setq work_dir_9 (concat work_dir_5 "/host-stream_tester/SD_VP_Integ/vp/src/stream_tester"))
  (setq work_dir_6 "/ssh:csdcd6@43.4.2.246:~/kamlesh_ws/coordinate_issue")
  (setq work_dir_librpp "/ssh:ubuntu@43.88.80.124:/home/ubuntu/rpp/vp1-project/build/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/librpp/0.21.5-r0/git/librpp/")
  (setq work_dir_t_librpp (concat "/ssh:csdcd4@43.4.2.120|ssh:root@10.0.52.12:/usr/local/vp1/lib/"))
  i
  ;; (setq work_dir_2 "/home/ubuntu/rpp/vp1-project/build/tmp/work/vp1-poky-linux-gnueabi/kernel-module-rpp/0.21.5-r0/git/drvrpp/")

  (setq work_dir_rpp_make "/ssh:ubuntu@43.88.80.124:/home/ubuntu/rpp/vp1-project/vp1-sdk-airbg/")
  (setq cscope_dir work_dir_1) ;;
  (setq cscope-initial-directory cscope_dir) ;;
  (shortcuts-after-setup)
  ;; (fset 'cscope-init-dir
  ;; 	"\C-xrbcscope-build\C-m\C-csa\C-m")

  ;; (execute-kbd-macro (symbol-function 'cscope-init-dir))
  ;; (defun clean-ci () (interactive) ((let ((default-directory concat (work_dir_4 "/rawdata/")))(shell "ls"))))
  )



;; mutt

;;(server-start)
;;(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

;;notmuch
(require 'notmuch)
(setq send-mail-function 'sendmail-send-it
      sendmail-program "/usr/bin/msmtp"
      mail-specify-envelope-from t
      message-sendmail-envelope-from 'header
      mail-envelope-from 'header)
(global-set-key (kbd "M-m") 'notmuch)

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
         (default-directory (expand-file-name work_dir_10)) ;;
	 )

    ;; (message (format "git checkout -b %s" message-id));; ;; ;;
    (call-process-shell-command (format (concat "git checkout master" " > ~/b4-check-patch 2>&1" )))
    (call-process-shell-command (format (concat "git branch |grep \"\\.\" | xargs git branch -D" " > ~/b4-check-patch 2>&1" )))
    (call-process-shell-command (format (concat "git branch -D " message-id " >> ~/b4-check-patch 2>&1"))) ;; ;; ;;
    (call-process-shell-command (format (concat "git checkout -b " message-id " >> ~/b4-check-patch 2>&1"))) ;; ;;
    ;; (message (format "git checkout  %s" message-id));; ;; ;;
    (message "message-id %s" message-id) 
    (call-process-shell-command ;; ;; ;;
     (format (concat "rm -rf b4-patch; mkdir -p b4-patch && b4 am -Q " message-id " -o b4-patch >> ~/b4-check-patch 2>&1" " && ./scripts/checkpatch.pl --strict b4-patch/*.patches/*.patch"  " | tee -a ~/b4-check-patch | " "if grep -q \"has style problems\"; then : ;else git am b4-patch/*.mbx >> ~/b4-check-patch 2>&1;fi ")) nil t nil)	   ;;   ;;   ;;	  ;;
    )  (pop-to-buffer (find-file "~/b4-check-patch")) 
  )


(defun b4-check-patch ()
  (interactive)
  (funcall-interactively 'b4-check-patch-process work_dir_2 "b4-new")
  )

(defun mbox-check-patch-notmuch-messages ()
  "When this function is executed in notmuch-show buffer all the \"open\"
messages will be written to the file ~/tmp-check-patch (overwriting it)."
  (interactive)
  (let* ((search-terms-list (notmuch-show-get-message-ids-for-open-messages))
	 (default-directory work_dir_1)
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
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")  ;;
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
					;("gnu-mirror" . "http://mirrors.163.com/elpa/gnu/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
					;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
					;("melpa-m" . "http://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/")
					;("org-n"   . "http://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/")
					;("gnu-m"   . "http://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/")))

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

;;ediff
;; turn off whitespace checking:
(setq ediff-diff-options "-w")
;; side by side diff
(setq ediff-split-window-function 'split-window-horizontally)
;; ne pas ouvrir de fenêtre séparée pour les contrôles :
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; refinement:
(setq-default ediff-forward-word-function 'forward-char)
(setq-default ediff-ignore-similar-regions t)
(setq-default ediff-highlight-all-diffs nil)
(defvar mkm/dired-file-1)

(defun mkm/ediff-push ()
  (interactive)
  (setq mkm/dired-file-1 (dired-get-filename)))
(defun mkm/ediff-pop ()
  (interactive)
  (ediff-files mkm/dired-file-1 (dired-get-filename)))
(add-hook 'dired-mode-hook
	  (lambda()
            (define-key dired-mode-map (kbd "C-c u") 'mkm/ediff-push)
            (define-key dired-mode-map (kbd "C-c o") 'mkm/ediff-pop)))
(defvar ediff-do-hexl-diff nil
  "variable used to store trigger for doing diff in hexl-mode")
(defadvice ediff-files-internal (around ediff-files-internal-for-binary-files activate)
  "catch the condition when the binary files differ

the reason for catching the error out here (when re-thrown from the inner advice)
is to let the stack continue to unwind before we start the new diff
otherwise some code in the middle of the stack expects some output that
isn't there and triggers an error"
  (let ((file-A (ad-get-arg 0))
        (file-B (ad-get-arg 1))
        ediff-do-hexl-diff)
    (condition-case err
        (progn
          ad-do-it)
      (error
       (if ediff-do-hexl-diff 
           (let ((buf-A (find-file-noselect file-A))
                 (buf-B (find-file-noselect file-B)))
             (with-current-buffer buf-A
	       (hexl-mode 1))
             (with-current-buffer buf-B
	       (hexl-mode 1))
             (ediff-buffers buf-A buf-B))
         (error (error-message-string err)))))))

(defadvice ediff-setup-diff-regions (around ediff-setup-diff-regions-for-binary-files activate)
  "when binary files differ, set the variable "
  (condition-case err
      (progn
        ad-do-it)
    (error
     (setq ediff-do-hexl-diff
           (and (string-match-p "^Errors in diff output.  Diff output is in.*"
                                (error-message-string err))
                (string-match-p "^\\(Binary \\)?[fF]iles .* and .* differ"
                                (buffer-substring-no-properties
                                 (line-beginning-position)
                                 (line-end-position)))
                (y-or-n-p "The binary files differ, look at the differences in hexl-mode? ")))
     (error (error-message-string err)))))
;; docker
;; Open files in Docker containers like so: /docker:drunk_bardeen:/etc/passwd

(require 'tramp)

(use-package docker
  :defer t
  :ensure t
  :config
  (docker-global-mode)) ;; manage docker containers

;; (push
;; (cons
;; "docker"
;; '((tramp-login-program "docker")
;; (tramp-login-args (("exec" "-w" "/workspace" "-it") ("%h") ("/bin/bash")))
;; (tramp-remote-shell "/bin/sh")
;; (tramp-remote-shell-args ("-i") ("-c"))))
;; tramp-methods)

;; (defadvice tramp-completion-handle-file-name-all-completions
;;     (around dotemacs-completion-docker activate)
;;     "(tramp-completion-handle-file-name-all-completions \"\" \"/docker:\" returns
;;     a list of active Docker container names, followed by colons."
;;     (if (equal (ad-get-arg 1) "/docker:")
;; 	(let* ((dockernames-raw (shell-command-to-string "docker ps | perl -we 'use strict; $_ = <>; m/^(.*)NAMES/ or die; my $offset = length($1); while(<>) {substr($_, 0, $offset, q()); chomp; for(split m/\\W+/) {print qq($_:\n)} }'"))
;; 	       (dockernames (cl-remove-if-not
;; 			     #'(lambda (dockerline) (string-match ":$" dockerline))
;; 			     (split-string dockernames-raw "\n"))))
;; 	  (setq ad-return-value dockernames))
;;       ad-do-it))

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

;;outline-code
					; Outline-minor-mode key map
;; (define-prefix-command 'cm-map nil "Outline-")
;; ; HIDE
;; (define-key cm-map "q" 'outline-hide-sublevels)    ; Hide everything but the top-level headings
;; (define-key cm-map "t" 'outline-hide-body)         ; Hide everything but headings (all body lines)
;; (define-key cm-map "o" 'outline-hide-other)        ; Hide other branches
;; (define-key cm-map "c" 'outline-hide-entry)        ; Hide this entry's body
;; (define-key cm-map "l" 'outline-hide-leaves)       ; Hide body lines in this entry and sub-entries
;; (define-key cm-map "d" 'outline-hide-subtree)      ; Hide everything in this entry and sub-entries
;; ; SHOW
;; (define-key cm-map "a" 'outline-show-all)          ; Show (expand) everything
;; (define-key cm-map "e" 'outline-show-entry)        ; Show this heading's body
;; (define-key cm-map "i" 'outline-show-children)     ; Show this heading's immediate child sub-headings
;; (define-key cm-map "k" 'outline-show-branches)     ; Show all sub-headings under this heading
;; (define-key cm-map "s" 'outline-show-subtree)      ; Show (expand) everything in this heading & below
;; ; MOVE
;; (define-key cm-map "u" 'outline-up-heading)                ; Up
;; (define-key cm-map "n" 'outline-next-visible-heading)      ; Next
;; (define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
;; (define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
;; (define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
;; (global-set-key "\M-p" cm-map)

;; cscope start

(setq cscope-do-not-update-database t)
(setq cscope-display-cscope-buffer nil)
(require 'xcscope)
(cscope-setup)

;; cscope end




;;cursor

(set-cursor-color "Orange")


;; indentation style
;; (setq c-default-style "linux"
;; c-basic-offset 4)
;; (c-set-offset 'case-label '+)

;; whitespaces 80 cloumn rule
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face empty tabs lines-tail trailing))
;; (global-whitespace-mode t) ;;

;; .. code-block:: none

;; .. code-block:: none

;; (defun c-lineup-arglist-tabs-only (ignored)
;;   "Line up argument lists by tabs, not spaces"
;;   (let* ((anchor (c-langelem-pos c-syntactic-element))
;;          (column (c-langelem-2nd-pos c-syntactic-element))
;;          (offset (- (1+ column) anchor))
;;          (steps (floor offset c-basic-offset)))
;;     (* (max steps 1)
;;        c-basic-offset)))

;; (dir-locals-set-class-variables
;;  'linux-kernel
;;  '((c-mode . (
;;               (c-basic-offset . 8)
;;               (c-label-minimum-indentation . 0)
;;               (c-offsets-alist . (
;;                                   (arglist-close         . c-lineup-arglist-tabs-only)
;;                                   (arglist-cont-nonempty .
;;                                                          (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
;;                                   (arglist-intro         . +)
;;                                   (brace-list-intro      . +)
;;                                   (c                     . c-lineup-C-comments)
;;                                   (case-label            . 0)
;;                                   (comment-intro         . c-lineup-comment)
;;                                   (cpp-define-intro      . +)
;;                                   (cpp-macro             . -1000)
;;                                   (cpp-macro-cont        . +)
;;                                   (defun-block-intro     . +)
;;                                   (else-clause           . 0)
;;                                   (func-decl-cont        . +)
;;                                   (inclass               . +)
;;                                   (inher-cont            . c-lineup-multi-inher)
;;                                   (knr-argdecl-intro     . 0)
;;                                   (label                 . -1000)
;;                                   (statement             . 0)
;;                                   (statement-block-intro . +)
;;                                   (statement-case-intro  . +)
;;                                   (statement-cont        . +)
;;                                   (substatement          . +)
;;                                   ))
;;               (indent-tabs-mode . t)
;;               (show-trailing-whitespace . t)
;;               ))))

;; (dir-locals-set-directory-class
;;  (expand-file-name work_dir)
;;  'linux-kernel)
(add-to-list 'auto-mode-alist '("\.cu$" . c-mode))

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux
kernel."
  (interactive)
  (c-mode)
  (setq c-basic-offset 8)
  (setq c-indent-level 8)
  (setq c-brace-imaginary-offset 0)
  (setq c-brace-offset -8)
  (setq c-argdecl-indent 8)
  (setq c-label-offset -8)
  (setq c-continued-statement-offset 8)
  (setq indent-tabs-mode nil)
  (setq tab-width 8))
(setq c-set-style "linux-tabs-only")

;; (defun c-lineup-arglist-tabs-only (ignored)
;;   "Line up argument lists by tabs, not spaces"
;;   (let* ((anchor (c-langelem-pos c-syntactic-element))
;;          (column (c-langelem-2nd-pos c-syntactic-element))
;;          (offset (- (1+ column) anchor))
;;          (steps (floor offset c-basic-offset)))
;;     (* (max steps 1)
;;        c-basic-offset)))

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             ;; Add kernel style
;;             (c-add-style
;;              "linux-tabs-only"
;;              '("linux" (c-offsets-alist
;;                         (arglist-cont-nonempty
;;                          c-lineup-gcc-asm-reg
;;                          c-lineup-arglist-tabs-only))))))

;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (let ((filename (buffer-file-name)))
;;               ;; Enable kernel mode for the appropriate files
;;               (when (and filename
;;                          (string-match (expand-file-name work_dir_3)
;;                                        filename))
;;                 (setq indent-tabs-mode t)
;;                 (setq show-trailing-whitespace t)
;;                 (c-set-style "linux-tabs-only")))))

(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(dir-locals-set-class-variables
 'linux-kernel
 '((c-mode . (
	      (c-basic-offset . 8)
	      (c-label-minimum-indentation . 0)
	      (c-offsets-alist . (
				  (arglist-close         . c-lineup-arglist-tabs-only)
				  (arglist-cont-nonempty .
							 (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
				  (arglist-intro         . +)
				  (brace-list-intro      . +)
				  (c                     . c-lineup-C-comments)
				  (case-label            . 0)
				  (comment-intro         . c-lineup-comment)
				  (cpp-define-intro      . +)
				  (cpp-macro             . -1000)
				  (cpp-macro-cont        . +)
				  (defun-block-intro     . +)
				  (else-clause           . 0)
				  (func-decl-cont        . +)
				  (inclass               . +)
				  (inher-cont            . c-lineup-multi-inher)
				  (knr-argdecl-intro     . 0)
				  (label                 . -1000)
				  (statement             . 0)
				  (statement-block-intro . +)
				  (statement-case-intro  . +)
				  (statement-cont        . +)
				  (substatement          . +)
				  ))
	      (indent-tabs-mode . t)
	      (show-trailing-whitespace . t)
	      ))))

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






;; git
;; (require 'git)
;; (require 'git-blame)
;; git end





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
(global-set-key (kbd "M-q") 'magit)


(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/site-lisp/magit/Documentation/"))
;; magit end



;; mutiiterm
(require 'multi-term)
(setq multi-term-program "/bin/bash")
;; multiterm end

;; org-mode
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

(defun skeleton-setup ()
  (interactive )

  (define-skeleton mmc-write
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (concat m-root-cmd " && " "sudo cp " work_dir_3  "/arch/arm64/boot/Image . && sudo cp " work_dir_3 "/arch/arm64/boot/dts/ti/k3-am625-sk.dtb dtb/ti/ && cd - && sudo make -j16 ARCH=arm64 INSTALL_MOD_PATH=" root-dir " modules_install && cd -" " && " um-root-cmd)
    )

  (define-skeleton mmc-bwrite
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (concat m-boot-cmd " && " cp-all-builds-to-mmc-cmd  " && " um-boot-cmd)
    )

  (define-skeleton cp-tib
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "./bin/check-warn.sh -d AM62x -o linux -a HEAD^ -b HEAD"
    )


  (define-skeleton wd3
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (concat "cd " work_dir_3)
    )

  (define-skeleton cp-tib
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (concat "cp " work_dir_4 "/tiboot3.bin tiboot3.bin")
    )

  (define-skeleton launcher
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (concat "cd ~/; python3 -m http.server 8080 & python3 launcher-test/launcher-test.py launcher-test/template.yaml ; cd -")
    )

  (define-skeleton cp-dts
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "sudo cp " work_dir_3 "/arch/arm64/boot/dts/ti/k3-am625-sk.dtb ."
    )

  (define-skeleton cp-image
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "sudo cp " work_dir_3 "/arch/arm64/boot/Image ."
    )

  (define-skeleton cp-tispl
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (concat "cp " work_dir_2 "/" a53-out-dir "/tispl.bin tispl.bin && cp " work_dir_2 "/" a53-out-dir "/u-boot.img u-boot.img")
    )


  (define-skeleton cp-kig-boot-to-all-builds
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format cp-kig-boot-to-all-builds-cmd)
    )

  (define-skeleton cp-binman-boot-to-all-builds-hs
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format cp-binman-boot-to-all-builds-cmd-hs)
    )

  (define-skeleton cp-binman-boot-to-all-builds-fs
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format cp-binman-boot-to-all-builds-cmd-hs-fs)
    )

  (define-skeleton cp-binman-boot-to-all-builds-gp
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format cp-binman-boot-to-all-builds-cmd-gp)  
    )

  (define-skeleton cp-all-builds-to-mmc
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format cp-all-builds-to-mmc-cmd)
    )	

  (define-skeleton modules-install
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (concat "sudo make -j16 ARCH=arm64 INSTALL_MOD_PATH=" root-dir " modules_install")
    )

  (define-skeleton ex-core-sec
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "export TI_SECURE_DEV_PKG=/home/kamlesh/core-secdev-k3 && ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh"
    )

  (define-skeleton make-image
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- Image"
    )

  (define-skeleton make-defconfig
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- tisdk_am62xx-evm_defconfig"
    )

  (define-skeleton mk-mod
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- modules"
    )

  (define-skeleton mk-optee
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "rm -rf out/ ; make -j32 CROSS_COMPILE=arm-none-linux-gnueabihf- CROSS_COMPILE64=aarch64-none-linux-gnu- PLATFORM=k3-am62x CFG_ARM64_core=y && cd ../ && make -j16 ARCH=arm CROSS_COMPILE=aarch64-none-linux-gnu- ATF=../../08.04.00.005/bl31.bin TEE=../../optee_os/out/arm-plat-k3/core/tee-pager_v2.bin DM=../../08.04.00.005/ipc_echo_testb_mcu1_0_release_strip.xer5f O=gp-84/a53"
    )

  (define-skeleton tcrypt
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "sudo modprobe tcrypt mode=329 sec=1"
    )

  (define-skeleton mcrc-reins
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "sudo modprobe -r mcrc && sudo insmod mcrc.ko"
    )

  (setq um-boot-cmd (concat "cd - && umount " boot-dir " && lsblk"))
  (define-skeleton um-boot
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format um-boot-cmd)
    )

  (setq m-boot-cmd (concat "udisksctl mount -b " boot-node " && cd " boot-dir))
  (define-skeleton m-boot
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format m-boot-cmd)
    )

  (setq um-root-cmd (concat "cd - && umount " root-dir " && lsblk"))
  (define-skeleton um-root
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format um-root-cmd)
    )

  (setq m-root-cmd (concat "udisksctl mount -b " root-node " && cd " root-dir "/boot/"))
  (define-skeleton m-root
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format m-root-cmd)
    )

  (define-skeleton mcrc-cp
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "sudo cp ~/am62/mcrc/ti-linux-kernel/drivers/crypto/ti/mcrc64.ko lib/modules/5.10.158-dirty/kernel/drivers/crypto/ti/"
    )

  (define-skeleton root-login
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "mkdir /etc/ssh/;echo 'PermitRootLogin Yes' >> /etc/ssh/sshd_config"
    )

  (define-skeleton mcrc-scp
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "sudo scp -oHostKeyAlgorithms=+ssh-rsa ~/am62/binman/linux-next/drivers/crypto/ti/mcrc64.ko debian@10.24.68.148:~/"
    )

  (define-skeleton mcrc-cp-native
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "sudo cp mcrc.ko /lib/modules/$(uname -r)/kernel/drivers/crypto/ti/"
    )

  (define-skeleton send-mcrc
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "udisksctl mount -b /dev/sdb2 && cd /media/kamlesh/root/ && sudo cp ~/am62/mcrc/ti-linux-kernel/drivers/crypto/ti/mcrc.ko lib/modules/5.10.158-dirty/kernel/drivers/crypto/ti/ && cd - && umount /media/kamlesh/root && lsblk"
    )

  (define-skeleton mail-patch
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "git send-email --to=kamlesh@ti.com"
    )


  (define-skeleton c-fit
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "sudo cp ~/am62/ti-linux-kernel/fit-crypto/fitImage ."
    )

  (define-skeleton d-print
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "printf(\"%s %d\\n\",__func__,__LINE__);"
    )
  (define-skeleton d-atf
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "INFO(\"%s %d\\n\",__func__,__LINE__);"
    )

  (define-skeleton k-print
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "printk(\"%s %d\\n\",__func__,__LINE__);"
    )

  (define-skeleton k-info
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "pr_info(\"%s %d\\n\",__func__,__LINE__);"
    )


  (define-skeleton pico-cmd-gp
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format pico-cmd-gp)
    )

  (define-skeleton pico-cmd-hs
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format pico-cmd-hs)
    )

  (define-skeleton pico-cmd
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format pico-cmd)
    )

  (define-skeleton relay-toggle
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format relay-toggle-cmd)
    )

  (define-skeleton dfu-cmd
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format dfu-cmd)
    )

  (define-skeleton devstat-cmd
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "python3 ~/repos/devstat/devstat.py am62e2 -m sdmmc"
    )

  (setq notmuch-update "mbsync -Va;echo $? && notmuch new; sh ~/notmuch-tag.sh")
  (define-skeleton notmuch-update-cmd
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format notmuch-update)
    )

  (define-skeleton rby
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "Reviewed-by: Kamlesh Gurudasani <kamlesh@ti.com>"
    )

    (define-skeleton aby
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "Acked-by: Kamlesh Gurudasani <kamlesh@ti.com>"
    )

  (define-skeleton sby
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>"
    )

  (define-skeleton aby
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "Acked-by: Kamlesh Gurudasani <kamlesh@ti.com>"
    )

  (define-skeleton soft-reset-mmc
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "mw.l 43000030 243 1;mw.l 43018170 00000006 1"
    )

  (define-skeleton rtcwake
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "rtcwake -s 5 -m mem"
    )
)

;; Custom legato


;; first file
(pop-to-buffer (find-file "~/.emacs"))
(defun dotemacs()
  (interactive )
  (let* ((buffer-name (format ".emacs"))
         (buffer (get-buffer buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      (pop-to-buffer (find-file "~/.emacs"))
      )))
;; first file end



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



;;Serial term

(defun serial-usb0()
  (interactive )
  (setq buffer-name-1 "/dev/ttyUSB0")
  (if (get-buffer buffer-name-1)
      (switch-to-buffer buffer-name-1)
    ;; (serial-term)
    
    (make-serial-process :port "/dev/ttyUSB0" :speed 115200)
    (serial-process-configure :process "/dev/ttyUSB0" :speed 115200)
    (switch-to-buffer buffer-name-1)
    ))
(defun serial-usb1()
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




;; dired single
;; todo
;; (require 'dired-single)
;; (setq dired-single-use-magic-buffer t)
;; (setq dired-single-magic-buffer-name '"repo")
(setq dired-auto-revert-buffer t)
;; (setq term-buffer-maximum-size 0)
;; dired single end


;; speedbar
(use-package sr-speedbar
  :ensure t
  :defer t
  :init
  ;; '(speedbar-visiting-file-hook (lambda () (other-window 1)))
  (setq sr-speedbar-right-side nil)
  (setq speedbar-show-unknown-files t)
  (setq sr-speedbar-width 35)
  (setq sr-speedbar-max-width 35)
  (setq speedbar-use-images nil)
  (setq speedbar-initial-expansion-list-name "files")
  (setq sr-speedbar-auto-refresh t)
  (setq sr-speedbar-skip-other-window-p t)
  ;; (sr-speedbar-open)
  ;; (speedbar)
  :config
  (with-current-buffer sr-speedbar-buffer-name
    (setq window-size-fixed 'width))
  )

;; centered cursor mode, definitely move to a new file
;; (if (display-graphic-p) (and
;;      (require 'centered-cursor-mode)
;;      (global-centered-cursor-mode +1)))
;; Compilation

(setq default-process-coding-system '(utf-8-unix . utf-8-unix))


;; (setq compile-rpp-cmd "scp /home/ubuntu/rpp/vp1-project/build/tmp/work/vp1-poky-linux-gnueabi/kernel-module-rpp/0.21.5-r0/git/drvrpp/rpp.ko  visos@43.4.0.177:~/kamlesh/")


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





;; shortcuts
;; (global-unset-key (kbd "<left>") ) ;;
;; (global-unset-key (kbd "<right>") ) ;;
;; (global-unset-key (kbd "<up>") ) ;;
;; (global-unset-key (kbd "<down>") ) ;;


;; Alt shortcuts

(defun shortcuts-before-setup()
  (interactive)
  ;; (global-set-key (kbd "M-11") (lambda () (interactive)(setq working-project-path "~/am62/mcrc/") (ti-setup))) ;;
  ;; (global-set-key (kbd "M-8") (lambda () (interactive)(setq working-project-path "~/am62/mainline/") (ti-setup))) ;; ;;
  ;; (global-set-key (kbd "M-8") (lambda () (interactive)(setq working-project-path "~/am62/crypto/") (ti-setup am62x ti))) ;; ;; ;;
  ;; (global-set-key (kbd "M-4") (lambda () (interactive)(setq working-project-path "~/am62/cr_valid/") (ti-setup ))) ;;
  ;; (global-set-key (kbd "M-6") (lambda () (interactive)(setq working-project-path "~/am62/cr_valid/") (ti-setup ))) ;;
  ;; (global-set-key (kbd "M-5") (lambda () (interactive)(setq working-project-path "~/am62/cr_valid/") (ti-setup ))) ;;
  ;; (global-set-key (kbd "M-7") 'gaia-csdcd4-setup) ;;
  ;; (global-set-key (kbd "M-4") (lambda () (interactive)(setq working-project-path "~/am62/cr_valid/") (ti-setup am62ax mainline))) ;;
  (global-set-key (kbd "M-3") (lambda () (interactive)(setq working-project-path "~/am62/binman/") (setq soc-type "hs-fs") (ti-setup )))
  (global-set-key (kbd "M-2") (lambda () (interactive)(setq working-project-path "~/am62/binman/am62lite-presil-build/") (setq soc-type "hs-fs")(ti-setup )))
  (global-set-key (kbd "M-4") (lambda () (interactive)(setq working-project-path "~/upstream-test/") (setq soc-type "hs")    (setq soc-type "hs-fs") (setq sign-type "binman") (setq device am64x) (setq source mainline) (setq boot-type "mmc")(ti-setup )))
  (global-set-key (kbd "M-i")(lambda() (interactive) (load-file "~/.emacs")))
  (global-set-key (kbd "M-o") 'dotemacs) )

(shortcuts-before-setup)
   
(defun shortcuts-after-setup()
  (interactive)


  ;; (setq cscope_dir work_dir_1) ;;
  ;; (setq cscope-initial-directory cscope_dir) ;; ;;
  (global-set-key (kbd "M-1") (lambda () (interactive) (switch-to-buffer (find-file  (concat work_dir_1 "/")))))

  ;; (global-set-key (kbd "M-2") (lambda () (interactive) (if (string-equal work_dir_2 "gaia4-login") (gaia-csdcd4-login)(switch-to-buffer (find-file (concat work_dir_2 "/"))))))

  (global-set-key (kbd "M-2") (lambda () (interactive) (if (string-match-p "gaia" work_dir_2) (gaia-csdcd34-login)(switch-to-buffer (find-file (concat work_dir_2 "/"))))))


  ;; (global-set-key (kbd "M-2") '      gaia-csdcd4-login)

  (global-set-key (kbd "M-3") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_3 "")))))
  (global-set-key (kbd "M-4") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_4 "")))))
  ;; (global-set-key (kbd "M-0") ')
  (global-set-key (kbd "M-5") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_5 "")))))
  ;; (global-set-key (kbd "M-5") 'ubuntu-wd)
  (global-set-key (kbd "M-6") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_6 "")))))
  (global-set-key (kbd "M-7") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_7 "")))))
  (global-set-key (kbd "C-c 6") (lambda () (interactive)(shell-pico)))
  (global-set-key (kbd "C-c 5") (lambda () (interactive)(shell-working-dir)))
  (global-set-key (kbd "C-c 7") (lambda () (interactive)(shell-extra)))
  (global-set-key (kbd "C-c 8") (lambda () (interactive)(shell-zebu-bash)))  
  (global-set-key (kbd "C-c 3") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_work_dir_3 "")))))
  (global-set-key (kbd "C-c 4") (lambda () (interactive) (let ((default-directory remote_work_dir_3)) (shell "remote"))))
  ;; (global-set-key (kbd "C-c 5") (lambda () (interactive) (mcrc))) ;;

  (global-set-key (kbd "M-9") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_9 "")))))

  ;; (global-set-key (kbd "M-d") 'scp-rpp)

  ;; (global-set-key (kbd "M-c") 'compile-rpp)

  ;; (global-set-key (kbd "M-n") 'other-window)

  ;; (global-set-key (kbd "M-p") 'install-legato)

  (global-set-key (kbd "M-s") 'tags-search)

  
  ;; (global-unset-key "I")
  ;; (global-set-key (kbd "I") 'previous-line)
  ;; (global-unset-key "J")
  ;; (global-set-key (kbd "J")200~set_freq_handler 'left-char)
  ;; (global-unset-key "K")
  ;; (global-set-key (kbd "K") 'next-line)
  ;; (global-unset-key "L")
  ;; (global-set-key (kbd "L") 'right-char)
  (global-unset-key (kbd "M-<left>")) ;;
  (global-set-key (kbd "M-<left>") 'previous-buffer) ;
  (global-unset-key (kbd "M-<right>"))
  (global-set-key (kbd "M-<right>") 'next-buffer) ;
  


  ;; ctrl

  ;; (global-set-key (kbd "C-<f1>") 'rpi-configure)

  ;; (global-set-key (kbd "C-<f4>") (lambda () (interactive) (switch-to-buffer "extra")))

  ;; (global-set-key (kbd "C-<f2>") (lambda () (interactive) (switch-to-buffer "ssh")))

  ;; (global-set-key (kbd "C-<f3>") (lambda () (interactive) (switch-to-buffer "dmesg")))


  ;; (global-set-key (kbd "C-1") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_dir "/")))))

  ;; (global-set-key (kbd "C-2") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_dir "/drivers/gpu/drm/tiny/ili9488.c")))))

  ;; (global-set-key (kbd "C-3") (lambda () (interactive) (switch-to-buffer (find-file  (concat remote_dir "/drivers/gpu/drm/tiny/ili9225.c")))))

  ;; (global-set-key (kbd "C-4") (lambda () (interactive) (switch-to-buffer (find-file  (concat remote_dir "/drivers/gpu/drm/tiny/ili9341.c")))))

  ;; (global-set-key (kbd "C-5") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_dir "/drivers/gpu/drm/tiny/st7789vw.c")))))

  ;; (global-set-key (kbd "C-2") (lambda () (interactive) (switch-to-buffer "*compilation*")))



  ;; (global-set-key (kbd "C-1") 'sr-speedbar-toggle)

  ;; (global-set-key (kbd "C-2") 'sr-speedbar-select-window)
  
  ;; (global-unset-key (kbd "C-l"))

  ;; ;; (global-unset-key (kbd "C-i"))

  ;; (global-unset-key (kbd "C-k"))

  ;; (global-unset-key (kbd "C-j"))


  ;; (global-set-key [?\H-i] 'previous-line     )

  ;; (global-set-key  (kbd "C-j") 'backward-char)

  ;; (global-set-key (kbd "C-k") 'next-line)

  ;; (global-set-key (kbd "C-l") 'forward-char)

  ;; (globl-set-key [C-i] 'forward-char forward-line previous-line      backward-char next-line)

  (global-unset-key [menu])

  (global-unset-key [f2])

  ;; (define-key global-map [(menu) (s)] (kbd "C-c s"))
  ;; (global-set-key (kbd "<menu>") (kbd "M-x"))

  ;; (define-key global-map [(menu)] cscope-find-this-symbol)
  ;; (global-set-key (kbd "<menu>") (lookup-key global-map (kbd "C-c s")))


  (define-key cscope-minor-mode-keymap (kbd "<f2>") (lookup-key cscope-minor-mode-keymap (kbd "C-c s")))

  ;; shortcuts end

  )



;; SISC

(defun exp3-configure()
  (interactive )
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (when (get-buffer "ssh")
    (kill-buffer "ssh"))
  (when (get-buffer "dmesg")
    (kill-buffer "dmesg"))
  (when (get-buffer "senscord")
    (kill-buffer "senscord"))
  (when (get-buffer "visos")
    (kill-buffer "visos"))
  (let* ((buffer-name (format "dmesg"))
         (buffer (get-buffer buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      ;; (term "/bin/bash")
      (shell buffer-name-1)
      (process-send-string
       (get-buffer-process buffer-name-1)
       (format "sshpass -p visos ssh visos@43.4.0.177\r cd kamlesh\r vp1-exp3\r dmesg -w\r"))))
  (let* ((buffer-name (format "senscord"))
         (buffer (get-buffer buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      (shell buffer-name-1)
      (process-send-string
       (get-buffer-process buffer-name-1)
       (format "sshpass -p visos ssh visos@43.4.0.177\r cd kamlesh\r vp1-exp3\r"))))
  (let* ((buffer-name (format "ssh"))
	 (buffer (get-buffer buffer-name)))
    (if buffer
	(switch-to-buffer buffer)
      ;; (term "/bin/bash")
      (shell buffer-name-1)
      (process-send-string
       (get-buffer-process buffer-name-1)
       (format "sshpass -p visos ssh visos@43.4.0.177\r cd kamlesh\r vp1-exp3\r modprobe rpp && ./stream_tester stereo_slam"))))
  (let* ((buffer-name (format "visos"))
	 (buffer (get-buffer buffer-name)))
    (if buffer
	(switch-to-buffer buffer)
      ;; (term "/bin/bash")
      (shell buffer-name-1)
      (process-send-string
       (get-buffer-process buffer-name-1)
       (format "sshpass -p visos ssh visos@43.4.0.177\r cd kamlesh\r cd exp3\r"))))
  )

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
  (while wait-for-completion (sleep-for sec msec))

  (setq wait-for-completion t)
  (relay-toggle-run)
  (while wait-for-completion (sleep-for sec msec))
  
  (setq wait-for-synchronous-completion nil)

  )





(defun shell-working-dir()
  (interactive )
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (setq buffer-name-1 "shell-working-dir")

  (if (get-buffer buffer-name-1)
      (switch-to-buffer buffer-name-1)
    (let ((default-directory work_dir_1)) (shell buffer-name-1) (format "cd am62lite-presil-build\r")))
  )

(defun shell-pico()
  (interactive)
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (setq buffer-name "pico")
  
  (if (get-buffer buffer-name)
      (switch-to-buffer buffer-name)
    
    (let ((default-directory work_dir_1))
      (multi-term)
      ;; (term)
      (term-send-string
       (get-buffer-process (rename-buffer buffer-name))
       (format pico-cmd)))))

(defun shell-extra()
  (interactive)
  (setq extra-cmd "python3 ~/pycrc/src/pycrc.py --width 64 --poly 0x000000000000001b --reflect-in False --xor-in 0x0000000000000000 --reflect-out False --xor-out 0x0000000000000000 --check-hexstring 44332211 -v")
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (setq buffer-name "extra")
  (define-skeleton extra-cmd
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format extra-cmd)
    )
  (if (get-buffer buffer-name)
      (switch-to-buffer buffer-name)
    (let ((default-directory work_dir_1)) (shell buffer-name) (format "cd ~/pycrc/src/\r")))
  )

(defun shell-zebu-bash()
  (interactive)
  (setq extra-cmd "python3 ~/pycrc/src/pycrc.py --width 64 --poly 0x000000000000001b --reflect-in False --xor-in 0x0000000000000000 --reflect-out False --xor-out 0x0000000000000000 --check-hexstring 44332211 -v")
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (setq buffer-name "zebu-bash")
  (define-skeleton extra-cmd
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format extra-cmd)
    )
  (if (get-buffer buffer-name)
      (switch-to-buffer buffer-name)
    (let ((default-directory work_dir_1)) (shell buffer-name) (format "cd ~/am62lite-presil-build/\r")))
  )

(defun serial-usb0()
  (interactive)
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (setq buffer-name "usb0")
  
  (if (get-buffer buffer-name)
      (switch-to-buffer buffer-name)
    
    (let ((default-directory work_dir_1))
      ;; (multi-term)
      ;; ;; (term)
      ;; (term-send-string
      ;;  (get-buffer-process (rename-buffer buffer-name))
      (shell buffer-name)
      (process-send-string
       (get-buffer-process buffer-name)
       (format "export DEV=/dev/ttyUSB0 && sudo picocom -b 115200 $DEV\n")
       )))
  )

(defun serial-usb4()
  (interactive)
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (setq buffer-name "usb4")
  
  (if (get-buffer buffer-name)
      (switch-to-buffer buffer-name)
    
    (let ((default-directory work_dir_1))
      ;; (multi-term)
      ;; ;; (term)
      ;; (term-send-string
      ;;  (get-buffer-process (rename-buffer buffer-name))
      (shell buffer-name)
      (process-send-string
       (get-buffer-process buffer-name)
       (format "export DEV=/dev/ttyUSB4 && sudo picocom -b 115200 $DEV\n")
       )))
  )



(defun shell-deepc-catkin()
  (interactive )
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (setq buffer-name-1 "docker-catkin")
  ;; (when (get-buffer buffer-name-1)
  ;; (kill-buffer buffer-name-1))
  (let ((default-directory work_dir_5))
    (shell buffer-name-1)
    (process-send-string
     (get-buffer-process buffer-name-1)
     (format "ls\r")))
  ;; (rst)
  )


;;add temp setups here


(fset '0USB
      (kmacro-lambda-form [?\C-\[ ?x ?s ?e ?r ?i ?a ?l ?- ?t ?e ?r ?m ?\C-m ?t ?t ?y ?U ?S ?B ?0 ?\C-m ?1 ?1 ?5 ?2 ?0 ?0 ?\C-m ?\C-c ?\C-j] 0 "%d"))

(fset '1USB
      (kmacro-lambda-form [?\C-\[ ?x ?s ?e ?r ?i ?a ?l ?- ?t ?e ?r ?m ?\C-m ?t ?t ?y ?U ?S ?B ?1 ?\C-m ?1 ?1 ?5 ?2 ?0 ?0 ?\C-m ?\C-c ?\C-j] 0 "%d"))

(fset '4USB
      (kmacro-lambda-form [?\C-\[ ?x ?s ?e ?r ?i ?a ?l ?- ?t ?e ?r ?m ?\C-m ?t ?t ?y ?U ?S ?B ?4 ?\C-m ?1 ?1 ?5 ?2 ?0 ?0 ?\C-m ?\C-c ?\C-j] 0 "%d"))

(fset '1USB
      (kmacro-lambda-form [?\C-\[ ?x ?s ?e ?r ?i ?a ?l ?- ?t ?e ?r ?m ?\C-m ?t ?t ?y ?U ?S ?B ?1 ?\C-m ?1 ?1 ?5 ?2 ?0 ?0 ?\C-m ?\C-c ?\C-j] 0 "%d"))

(global-set-key (kbd "C-c 1") (lambda () (interactive)(if (get-buffer "usb0") (switch-to-buffer "usb0")(serial-usb0))))
(global-set-key (kbd "C-c 2") (lambda () (interactive)(if (get-buffer "usb4") (switch-to-buffer "usb4")(serial-usb4))))
(global-set-key (kbd "C-c C-m") 'line-mode)


;; (fset 'mcrc
;;    (kmacro-lambda-form [?\C-x ?b ?m ?c ?r ?c ?. ?c ?\C-m] 0 "%d"))

(fset 'line-mode
      (kmacro-lambda-form [?\C-\[ ?x ?t ?e ?r ?m ?- ?l ?i ?\C-i ?\C-m] 0 "%d"))
(put 'erase-buffer 'disabled nil)


(fset 'jump-to-M-1
      (kmacro-lambda-form [?\C-s ?M ?- ?1] 0 "%d"))

(fset 'single-screen
      (kmacro-lambda-form [?\C-x ?1] 0 "%d"))

(fset 'remove-names-from-mail
      (kmacro-lambda-form [?\C-@ ?\C-s ?< ?\C-m ?\C-w ?\C-s ?> ?\C-\[ ?O ?D ?\C-k ?\C-\[ ?O ?B ?\C-a] 0 "%d"))

(fset 'add-to-to-mail
      (kmacro-lambda-form [?- ?- ?t ?o ?= ?\C-\[ ?O ?B ?\C-a] 0 "%d"))

(jump-to-M-1)
(single-screen)


(fset 'edittable
   (kmacro-lambda-form [?\C-s ?  ?\C-m ?\C-@ ?\C-s ?  ?\C-m ?\C-\[ ?O ?D ?\C-\[ ?w ?\C-x ?o ?\C-s ?\( ?\C-m ?\C-@ ?\C-s ?, ?\C-m ?\C-\[ ?O ?D ?\C-\[ ?w ?\C-\[ ?\[ ?1 ?~ ?\C-\[ ?% ?\C-y ?\C-m ?\C-y ?\C-\[ ?y ?\C-m ?! ?\C-\[ ?\[ ?1 ?~ ?\C-\[ ?O ?B ?\C-\[ ?O ?A ?\C-s ?\) ?\C-\[ ?O ?C ?\C-\[ ?O ?B ?\C-\[ ?\[ ?1 ?~ ?\C-x ?o ?\C-\[ ?\[ ?1 ?~ ?\C-\[ ?O ?B] 0 "%d"))

(cancel-function-timers fetch-mail)
(run-with-idle-timer (* 5 60) 0 'fetch-mail)
