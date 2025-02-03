(defun skeleton-setup ()
  (interactive )

  ;; (define-skeleton mmc-write
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (concat m-root-cmd " && " "sudo cp " work_dir_3  "/arch/arm64/boot/Image . && sudo cp " work_dir_3 "/arch/arm64/boot/dts/ti/k3-am625-sk.dtb dtb/ti/ && cd - && sudo make -j16 ARCH=arm64 INSTALL_MOD_PATH=" root-dir " modules_install && cd -" " && " um-root-cmd)
  ;;   )

  ;; (define-skeleton mmc-bwrite
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (concat m-boot-cmd " && " cp-all-builds-to-mmc-cmd  " && " um-boot-cmd)
  ;;   )

  ;; (define-skeleton cp-tib
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "./bin/check-warn.sh -d AM62x -o linux -a HEAD^ -b HEAD"
  ;;   )


  ;; (define-skeleton wd3
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (concat "cd " work_dir_3)
  ;;   )

  ;; (define-skeleton cp-tib
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (concat "cp " work_dir_4 "/tiboot3.bin tiboot3.bin")
  ;;   )

  ;; (define-skeleton launcher
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (concat "cd ~/; python3 -m http.server 8080 & python3 launcher-test/launcher-test.py launcher-test/template.yaml ; cd -")
  ;;   )

  ;; (define-skeleton cp-dts
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "sudo cp " work_dir_3 "/arch/arm64/boot/dts/ti/k3-am625-sk.dtb ."
  ;;   )

  ;; (define-skeleton cp-image
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "sudo cp " work_dir_3 "/arch/arm64/boot/Image ."
  ;;   )

  ;; (define-skeleton cp-tispl
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (concat "cp " work_dir_2 "/" a53-out-dir "/tispl.bin tispl.bin && cp " work_dir_2 "/" a53-out-dir "/u-boot.img u-boot.img")
  ;;   )


  ;; (define-skeleton cp-kig-boot-to-all-builds
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format cp-kig-boot-to-all-builds-cmd)
  ;;   )

  ;; (define-skeleton cp-binman-boot-to-all-builds-hs
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format cp-binman-boot-to-all-builds-cmd-hs)
  ;;   )

  ;; (define-skeleton cp-binman-boot-to-all-builds-fs
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format cp-binman-boot-to-all-builds-cmd-hs-fs)
  ;;   )

  ;; (define-skeleton cp-binman-boot-to-all-builds-gp
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format cp-binman-boot-to-all-builds-cmd-gp)  
  ;;   )

  ;; (define-skeleton cp-all-builds-to-mmc
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format cp-all-builds-to-mmc-cmd)
  ;;   )	

  ;; (define-skeleton modules-install
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (concat "sudo make -j16 ARCH=arm64 INSTALL_MOD_PATH=" root-dir " modules_install")
  ;;   )

  ;; (define-skeleton ex-core-sec
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "export TI_SECURE_DEV_PKG=/home/kamlesh/core-secdev-k3 && ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh"
  ;;   )

  ;; (define-skeleton make-image
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- Image"
  ;;   )

  ;; (define-skeleton make-defconfig
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- tisdk_am62xx-evm_defconfig"
  ;;   )

  ;; (define-skeleton mk-mod
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- modules"
  ;;   )

  ;; (define-skeleton mk-optee
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "rm -rf out/ ; make -j32 CROSS_COMPILE=arm-none-linux-gnueabihf- CROSS_COMPILE64=aarch64-none-linux-gnu- PLATFORM=k3-am62x CFG_ARM64_core=y && cd ../ && make -j16 ARCH=arm CROSS_COMPILE=aarch64-none-linux-gnu- ATF=../../08.04.00.005/bl31.bin TEE=../../optee_os/out/arm-plat-k3/core/tee-pager_v2.bin DM=../../08.04.00.005/ipc_echo_testb_mcu1_0_release_strip.xer5f O=gp-84/a53"
  ;;   )

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

  ;; (setq um-boot-cmd (concat "cd - && umount " boot-dir " && lsblk"))
  ;; (define-skeleton um-boot
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format um-boot-cmd)
  ;;   )

  ;; (setq m-boot-cmd (concat "udisksctl mount -b " boot-node " && cd " boot-dir))
  ;; (define-skeleton m-boot
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format m-boot-cmd)
  ;;   )

  ;; (setq um-root-cmd (concat "cd - && umount " root-dir " && lsblk"))
  ;; (define-skeleton um-root
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format um-root-cmd)
  ;;   )

  ;; (setq m-root-cmd (concat "udisksctl mount -b " root-node " && cd " root-dir "/boot/"))
  ;; (define-skeleton m-root
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format m-root-cmd)
  ;;   )

  ;; (define-skeleton mcrc-cp
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "sudo cp ~/am62/mcrc/ti-linux-kernel/drivers/crypto/ti/mcrc64.ko lib/modules/5.10.158-dirty/kernel/drivers/crypto/ti/"
  ;;   )

  ;; (define-skeleton root-login
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "mkdir /etc/ssh/;echo 'PermitRootLogin Yes' >> /etc/ssh/sshd_config"
  ;;   )

  ;; (define-skeleton mcrc-scp
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "sudo scp -oHostKeyAlgorithms=+ssh-rsa ~/am62/binman/linux-next/drivers/crypto/ti/mcrc64.ko debian@10.24.68.148:~/"
  ;;   )

  ;; (define-skeleton mcrc-cp-native
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "sudo cp mcrc.ko /lib/modules/$(uname -r)/kernel/drivers/crypto/ti/"
  ;;   )

  ;; (define-skeleton send-mcrc
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "udisksctl mount -b /dev/sdb2 && cd /media/kamlesh/root/ && sudo cp ~/am62/mcrc/ti-linux-kernel/drivers/crypto/ti/mcrc.ko lib/modules/5.10.158-dirty/kernel/drivers/crypto/ti/ && cd - && umount /media/kamlesh/root && lsblk"
  ;;   )

  ;; (define-skeleton mail-patch
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "git send-email --to=kamlesh@ti.com"
  ;;   )


  ;; (define-skeleton c-fit
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   "sudo cp ~/am62/ti-linux-kernel/fit-crypto/fitImage ."
  ;;   )

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


  ;; (define-skeleton pico-cmd-gp
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format pico-cmd-gp)
  ;;   )

  ;; (define-skeleton pico-cmd-hs
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format pico-cmd-hs)
  ;;   )

  ;; (define-skeleton pico-cmd
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format pico-cmd)
  ;;   )

  ;; (define-skeleton relay-toggle
  ;;   "In-buffer settings info for a emacs-org file."
  ;;   "Title: "
  ;;   (format relay-toggle-cmd)
  ;;   )

(setq dfu-cmd uboot-run-cmd)  
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
(skeleton-setup)
