(defun skeleton-setup ()
  (interactive )

  (define-skeleton launcher
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (concat "cd ~/; python3 -m http.server 8080 & python3 launcher-test/launcher-test.py launcher-test/template.yaml ; cd -")
    )

  (define-skeleton modules-install
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (concat "sudo make -j16 ARCH=arm64 INSTALL_MOD_PATH=" root-dir " modules_install")
    )

  (define-skeleton make-image
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- Image"
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

  (setq root-node "/dev/sda2")
  (setq root-dir "/media/kamlesh/root")
  (setq root-dir-compile "/media/root/root")

  (setq um-root-cmd (concat "cd - && umount " root-dir " && lsblk"))
  (setq um-root-compile-cmd (concat "sudo umount " root-dir-compile " && lsblk"))
  (define-skeleton um-root-cmd
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format um-root-cmd)
    )

  (setq m-root-cmd (concat "udisksctl mount -b " root-node " && cd " root-dir "/boot/"))
  (setq m-root-compile-cmd (concat "lsblk && udisksctl mount -b " root-node ))
  (define-skeleton m-root-cmd
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format m-root-cmd)
    )

  (setq cp-image-cmd (concat "sudo cp " projectile-root "/arch/arm64/boot/Image " root-dir "/boot/"))
  (define-skeleton cp-image-cmd
    "In-buffer settings info for a emacs-org file."
    "Title: "
    (format cp-image-cmd)
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
    (format soft-reset)
    )

  (define-skeleton rtcwake
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "rtcwake -s 5 -m mem"
    )

  (define-skeleton ums
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "ums 0 mmc 1\\r\\n"
    )

    (define-skeleton ex-cmd-uboot
  "In-buffer settings info for a emacs-org file."
  "Title: "
  (process-send-string (get-buffer-process (current-buffer)) "\r"))
  )

  (define-skeleton ex-cp-Image
    "In-buffer settings info for a emacs-org file."
    "Title: "
    "relay-reset nil sleep-for-n 2 switch-project ti-u-boot-cgit dfu-boot nil serial-usb0 nil monitor-buffer-for-autoboot nil switch-project ti-linux-kernel-cgit sleep-for-n 5 m-root nil cp-image nil um-root nil serial-usb0 nil comint-interrupt-subjob nil send-to-uboot boot ex-cmd-uboot nil"
    )


  
(setq soft-reset-am62 "mw.l 43000030 243 1;mw.l 43018170 00000006 1")

(skeleton-setup)
