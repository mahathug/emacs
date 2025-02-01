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

;; (defun skeleton-setup ()
;;   (interactive )

;;   (define-skeleton mmc-write
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (concat m-root-cmd " && " "sudo cp " work_dir_3  "/arch/arm64/boot/Image . && sudo cp " work_dir_3 "/arch/arm64/boot/dts/ti/k3-am625-sk.dtb dtb/ti/ && cd - && sudo make -j16 ARCH=arm64 INSTALL_MOD_PATH=" root-dir " modules_install && cd -" " && " um-root-cmd)
;;     )

;;   (define-skeleton mmc-bwrite
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (concat m-boot-cmd " && " cp-all-builds-to-mmc-cmd  " && " um-boot-cmd)
;;     )

;;   (define-skeleton cp-tib
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "./bin/check-warn.sh -d AM62x -o linux -a HEAD^ -b HEAD"
;;     )


;;   (define-skeleton wd3
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (concat "cd " work_dir_3)
;;     )

;;   (define-skeleton cp-tib
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (concat "cp " work_dir_4 "/tiboot3.bin tiboot3.bin")
;;     )

;;   (define-skeleton launcher
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (concat "cd ~/; python3 -m http.server 8080 & python3 launcher-test/launcher-test.py launcher-test/template.yaml ; cd -")
;;     )

;;   (define-skeleton cp-dts
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "sudo cp " work_dir_3 "/arch/arm64/boot/dts/ti/k3-am625-sk.dtb ."
;;     )

;;   (define-skeleton cp-image
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "sudo cp " work_dir_3 "/arch/arm64/boot/Image ."
;;     )

;;   (define-skeleton cp-tispl
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (concat "cp " work_dir_2 "/" a53-out-dir "/tispl.bin tispl.bin && cp " work_dir_2 "/" a53-out-dir "/u-boot.img u-boot.img")
;;     )


;;   (define-skeleton cp-kig-boot-to-all-builds
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format cp-kig-boot-to-all-builds-cmd)
;;     )

;;   (define-skeleton cp-binman-boot-to-all-builds-hs
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format cp-binman-boot-to-all-builds-cmd-hs)
;;     )

;;   (define-skeleton cp-binman-boot-to-all-builds-fs
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format cp-binman-boot-to-all-builds-cmd-hs-fs)
;;     )

;;   (define-skeleton cp-binman-boot-to-all-builds-gp
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format cp-binman-boot-to-all-builds-cmd-gp)  
;;     )

;;   (define-skeleton cp-all-builds-to-mmc
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format cp-all-builds-to-mmc-cmd)
;;     )	

;;   (define-skeleton modules-install
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (concat "sudo make -j16 ARCH=arm64 INSTALL_MOD_PATH=" root-dir " modules_install")
;;     )

;;   (define-skeleton ex-core-sec
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "export TI_SECURE_DEV_PKG=/home/kamlesh/core-secdev-k3 && ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh"
;;     )

;;   (define-skeleton make-image
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- Image"
;;     )

;;   (define-skeleton make-defconfig
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- tisdk_am62xx-evm_defconfig"
;;     )

;;   (define-skeleton mk-mod
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- modules"
;;     )

;;   (define-skeleton mk-optee
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "rm -rf out/ ; make -j32 CROSS_COMPILE=arm-none-linux-gnueabihf- CROSS_COMPILE64=aarch64-none-linux-gnu- PLATFORM=k3-am62x CFG_ARM64_core=y && cd ../ && make -j16 ARCH=arm CROSS_COMPILE=aarch64-none-linux-gnu- ATF=../../08.04.00.005/bl31.bin TEE=../../optee_os/out/arm-plat-k3/core/tee-pager_v2.bin DM=../../08.04.00.005/ipc_echo_testb_mcu1_0_release_strip.xer5f O=gp-84/a53"
;;     )

;;   (define-skeleton tcrypt
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "sudo modprobe tcrypt mode=329 sec=1"
;;     )

;;   (define-skeleton mcrc-reins
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "sudo modprobe -r mcrc && sudo insmod mcrc.ko"
;;     )

;;   (setq um-boot-cmd (concat "cd - && umount " boot-dir " && lsblk"))
;;   (define-skeleton um-boot
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format um-boot-cmd)
;;     )

;;   (setq m-boot-cmd (concat "udisksctl mount -b " boot-node " && cd " boot-dir))
;;   (define-skeleton m-boot
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format m-boot-cmd)
;;     )

;;   (setq um-root-cmd (concat "cd - && umount " root-dir " && lsblk"))
;;   (define-skeleton um-root
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format um-root-cmd)
;;     )

;;   (setq m-root-cmd (concat "udisksctl mount -b " root-node " && cd " root-dir "/boot/"))
;;   (define-skeleton m-root
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format m-root-cmd)
;;     )

;;   (define-skeleton mcrc-cp
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "sudo cp ~/am62/mcrc/ti-linux-kernel/drivers/crypto/ti/mcrc64.ko lib/modules/5.10.158-dirty/kernel/drivers/crypto/ti/"
;;     )

;;   (define-skeleton root-login
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "mkdir /etc/ssh/;echo 'PermitRootLogin Yes' >> /etc/ssh/sshd_config"
;;     )

;;   (define-skeleton mcrc-scp
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "sudo scp -oHostKeyAlgorithms=+ssh-rsa ~/am62/binman/linux-next/drivers/crypto/ti/mcrc64.ko debian@10.24.68.148:~/"
;;     )

;;   (define-skeleton mcrc-cp-native
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "sudo cp mcrc.ko /lib/modules/$(uname -r)/kernel/drivers/crypto/ti/"
;;     )

;;   (define-skeleton send-mcrc
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "udisksctl mount -b /dev/sdb2 && cd /media/kamlesh/root/ && sudo cp ~/am62/mcrc/ti-linux-kernel/drivers/crypto/ti/mcrc.ko lib/modules/5.10.158-dirty/kernel/drivers/crypto/ti/ && cd - && umount /media/kamlesh/root && lsblk"
;;     )

;;   (define-skeleton mail-patch
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "git send-email --to=kamlesh@ti.com"
;;     )


;;   (define-skeleton c-fit
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "sudo cp ~/am62/ti-linux-kernel/fit-crypto/fitImage ."
;;     )

;;   (define-skeleton d-print
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "printf(\"%s %d\\n\",__func__,__LINE__);"
;;     )
;;   (define-skeleton d-atf
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "INFO(\"%s %d\\n\",__func__,__LINE__);"
;;     )

;;   (define-skeleton k-print
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "printk(\"%s %d\\n\",__func__,__LINE__);"
;;     )

;;   (define-skeleton k-info
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "pr_info(\"%s %d\\n\",__func__,__LINE__);"
;;     )


;;   (define-skeleton pico-cmd-gp
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format pico-cmd-gp)
;;     )

;;   (define-skeleton pico-cmd-hs
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format pico-cmd-hs)
;;     )

;;   (define-skeleton pico-cmd
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format pico-cmd)
;;     )

;;   (define-skeleton relay-toggle
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format relay-toggle-cmd)
;;     )

;;   (define-skeleton dfu-cmd
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format dfu-cmd)
;;     )

;;   (define-skeleton devstat-cmd
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "python3 ~/repos/devstat/devstat.py am62e2 -m sdmmc"
;;     )

;;   (setq notmuch-update "mbsync -Va;echo $? && notmuch new; sh ~/notmuch-tag.sh")
;;   (define-skeleton notmuch-update-cmd
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     (format notmuch-update)
;;     )

;;   (define-skeleton rby
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "Reviewed-by: Kamlesh Gurudasani <kamlesh@ti.com>"
;;     )

;;     (define-skeleton aby
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "Acked-by: Kamlesh Gurudasani <kamlesh@ti.com>"
;;     )

;;   (define-skeleton sby
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>"
;;     )

;;   (define-skeleton aby
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "Acked-by: Kamlesh Gurudasani <kamlesh@ti.com>"
;;     )

;;   (define-skeleton soft-reset-mmc
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "mw.l 43000030 243 1;mw.l 43018170 00000006 1"
;;     )

;;   (define-skeleton rtcwake
;;     "In-buffer settings info for a emacs-org file."
;;     "Title: "
;;     "rtcwake -s 5 -m mem"
;;     )
;; )


;; ;; Alt shortcuts

;; (defun shortcuts-before-setup()
;;   (interactive)
;;   ;; (global-set-key (kbd "M-11") (lambda () (interactive)(setq working-project-path "~/am62/mcrc/") (ti-setup))) ;;
;;   ;; (global-set-key (kbd "M-8") (lambda () (interactive)(setq working-project-path "~/am62/mainline/") (ti-setup))) ;; ;;
;;   ;; (global-set-key (kbd "M-8") (lambda () (interactive)(setq working-project-path "~/am62/crypto/") (ti-setup am62x ti))) ;; ;; ;;
;;   ;; (global-set-key (kbd "M-4") (lambda () (interactive)(setq working-project-path "~/am62/cr_valid/") (ti-setup ))) ;;
;;   ;; (global-set-key (kbd "M-6") (lambda () (interactive)(setq working-project-path "~/am62/cr_valid/") (ti-setup ))) ;;
;;   ;; (global-set-key (kbd "M-5") (lambda () (interactive)(setq working-projec-path "~/am62/cr_valid/") (ti-setup ))) ;;
;;   ;; (global-set-key (kbd "M-7") 'gaia-csdcd4-setup) ;;
;;   ;; (global-set-key (kbd "M-4") (lambda () (interactive)(setq working-project-path "~/am62/cr_valid/") (ti-setup am62ax mainline))) ;;
;;   (global-set-key (kbd "M-3") (lambda () (interactive)(setq working-project-path "~/am62/binman/am62l-wakeup/") (setq soc-type "hs-fs") (ti-setup )))
;;   (global-set-key (kbd "M-2") (lambda () (interactive)(setq working-project-path "~/am62/binman/am62lite-presil-build/") (setq soc-type "hs-fs")(ti-setup )))
;;   (global-set-key (kbd "M-5") (lambda () (interactive)(setq working-project-path "~/am62/binman/") (setq soc-type "hs-fs")(ti-setup )))
;;   (global-set-key (kbd "M-4") (lambda () (interactive)(setq working-project-path "~/upstream-test/") (setq soc-type "hs")    (setq soc-type "hs-fs") (setq sign-type "binman") (setq device am64x) (setq source mainline) (setq boot-type "mmc")(ti-setup )))
;;   (global-set-key (kbd "M-i")(lambda() (interactive) (load-file "~/.init.el")))
;;   (global-set-key (kbd "M-o") 'dotemacs) )

;; (shortcuts-before-setup)
   
;; (defun shortcuts-after-setup()
;;   (interactive)


;;   ;; (setq cscope_dir work_dir_1) ;;
;;   ;; (setq cscope-initial-directory cscope_dir) ;; ;;
;;   (global-set-key (kbd "M-1") (lambda () (interactive) (switch-to-buffer (find-file  (concat work_dir_1 "/")))))

;;   ;; (global-set-key (kbd "M-2") (lambda () (interactive) (if (string-equal work_dir_2 "gaia4-login") (gaia-csdcd4-login)(switch-to-buffer (find-file (concat work_dir_2 "/"))))))

;;   (global-set-key (kbd "M-2") (lambda () (interactive) (if (string-match-p "gaia" work_dir_2) (gaia-csdcd34-login)(switch-to-buffer (find-file (concat work_dir_2 "/"))))))


;;   ;; (global-set-key (kbd "M-2") '      gaia-csdcd4-login)

;;   (global-set-key (kbd "M-3") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_3 "")))))
;;   (global-set-key (kbd "M-4") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_4 "")))))
;;   ;; (global-set-key (kbd "M-0") ')
;;   (global-set-key (kbd "M-5") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_5 "")))))
;;   ;; (global-set-key (kbd "M-5") 'ubuntu-wd)
;;   (global-set-key (kbd "M-6") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_6 "")))))
;;   (global-set-key (kbd "M-7") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_7 "")))))
;;   (global-set-key (kbd "C-c 6") (lambda () (interactive)(shell-pico)))
;;   (global-set-key (kbd "C-c 5") (lambda () (interactive)(shell-working-dir)))
;;   (global-set-key (kbd "C-c 7") (lambda () (interactive)(shell-extra)))
;;   (global-set-key (kbd "C-c 8") (lambda () (interactive)(shell-zebu-bash)))  
;;   (global-set-key (kbd "C-c 3") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_work_dir_3 "")))))
;;   (global-set-key (kbd "C-c 4") (lambda () (interactive) (let ((default-directory remote_work_dir_3)) (shell "remote"))))
;;   ;; (global-set-key (kbd "C-c 5") (lambda () (interactive) (mcrc))) ;;

;;   (global-set-key (kbd "M-9") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir_9 "")))))

;;   ;; (global-set-key (kbd "M-d") 'scp-rpp)

;;   ;; (global-set-key (kbd "M-c") 'compile-rpp)

;;   ;; (global-set-key (kbd "M-n") 'other-window)

;;   ;; (global-set-key (kbd "M-p") 'install-legato)

;;   (global-set-key (kbd "M-s") 'tags-search)

  
;;   ;; (global-unset-key "I")
;;   ;; (global-set-key (kbd "I") 'previous-line)
;;   ;; (global-unset-key "J")
;;   ;; (global-set-key (kbd "J")200~set_freq_handler 'left-char)
;;   ;; (global-unset-key "K")
;;   ;; (global-set-key (kbd "K") 'next-line)
;;   ;; (global-unset-key "L")
;;   ;; (global-set-key (kbd "L") 'right-char)
;;   (global-unset-key (kbd "M-<left>")) ;;
;;   (global-set-key (kbd "M-<left>") 'previous-buffer) ;
;;   (global-unset-key (kbd "M-<right>"))
;;   (global-set-key (kbd "M-<right>") 'next-buffer) ;
  


;;   ;; ctrl

;;   ;; (global-set-key (kbd "C-<f1>") 'rpi-configure)

;;   ;; (global-set-key (kbd "C-<f4>") (lambda () (interactive) (switch-to-buffer "extra")))

;;   ;; (global-set-key (kbd "C-<f2>") (lambda () (interactive) (switch-to-buffer "ssh")))

;;   ;; (global-set-key (kbd "C-<f3>") (lambda () (interactive) (switch-to-buffer "dmesg")))


;;   ;; (global-set-key (kbd "C-1") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_dir "/")))))

;;   ;; (global-set-key (kbd "C-2") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_dir "/drivers/gpu/drm/tiny/ili9488.c")))))

;;   ;; (global-set-key (kbd "C-3") (lambda () (interactive) (switch-to-buffer (find-file  (concat remote_dir "/drivers/gpu/drm/tiny/ili9225.c")))))

;;   ;; (global-set-key (kbd "C-4") (lambda () (interactive) (switch-to-buffer (find-file  (concat remote_dir "/drivers/gpu/drm/tiny/ili9341.c")))))

;;   ;; (global-set-key (kbd "C-5") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_dir "/drivers/gpu/drm/tiny/st7789vw.c")))))

;;   ;; (global-set-key (kbd "C-2") (lambda () (interactive) (switch-to-buffer "*compilation*")))



;;   ;; (global-set-key (kbd "C-1") 'sr-speedbar-toggle)

;;   ;; (global-set-key (kbd "C-2") 'sr-speedbar-select-window)
  
;;   ;; (global-unset-key (kbd "C-l"))

;;   ;; ;; (global-unset-key (kbd "C-i"))

;;   ;; (global-unset-key (kbd "C-k"))

;;   ;; (global-unset-key (kbd "C-j"))


;;   ;; (global-set-key [?\H-i] 'previous-line     )

;;   ;; (global-set-key  (kbd "C-j") 'backward-char)

;;   ;; (global-set-key (kbd "C-k") 'next-line)

;;   ;; (global-set-key (kbd "C-l") 'forward-char)

;;   ;; (globl-set-key [C-i] 'forward-char forward-line previous-line      backward-char next-line)

;;   (global-unset-key [menu])

;;   (global-unset-key [f2])

;;   ;; (define-key global-map [(menu) (s)] (kbd "C-c s"))
;;   ;; (global-set-key (kbd "<menu>") (kbd "M-x"))

;;   ;; (define-key global-map [(menu)] cscope-find-this-symbol)
;;   ;; (global-set-key (kbd "<menu>") (lookup-key global-map (kbd "C-c s")))


;;   (define-key cscope-minor-mode-keymap (kbd "<f2>") (lookup-key cscope-minor-mode-keymap (kbd "C-c s")))

;;   ;; shortcuts end

;;   )

