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
    (setq boot-node "/dev/sdb1")
    (setq root-node "/dev/sdb2")
    (setq relay-number-am62x "0")
    (setq relay-number-am64x "1")
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
    ;; (setq atf-base-make-cmd " make ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=lite SPD=opteed clean && make ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=lite SPD=opteed ") ;; ;; ;; ;;
    (setq atf-base-make-cmd " make ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=am62lite SPD=opteed clean && make ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=am62lite SPD=opteed ") ;; ;; ;;
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
    ;; (setq relay-toggle-cmd (concat "perl ~/relay/perl/perl_eth.pl " relay-number " && sleep 2")) ;;
    (setq relay-toggle-cmd (concat "ssh admin@relay-kamlesh -t \"if uom get relay/outlets/"relay-number"/state | grep -q \"true\"; then uom set relay/outlets/"relay-number"/state false  ;else uom set relay/outlets/"relay-number"/state true;fi\""))
    )
  (relay-cmd-setup)
  (skeleton-setup)
  ;;mandotory fixes here

  ;; 
  )

(defun my-projectile-compile-commands ()
  "Set project-specific compile command using Projectile."
  (when (projectile-project-root) ;; Ensure we are in a Projectile project
    (let ((proj-root (projectile-project-root)))
      (cond
       ((string-match "trusted" proj-root)
	(setq-local compile-command "make -j4"))
       ((string-match "tee" proj-root)
	(setq-local compile-command "gcc main.c -o main"))
       (t
	(setq-local compile-command "make")))))) ;; Default fallback

(add-hook 'projectile-after-switch-project-hook #'my-projectile-compile-commands)



