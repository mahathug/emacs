(setq atf-make-cmd "make CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3low TARGET_BOARD=am62lx LOG_LEVEL=50 && cp build/k3low/am62lx/release/bl31.bin ../bin/bl31.bin")

(setq optee-make-cmd "make CROSS_COMPILE=arm-none-linux-gnueabihf- CROSS_COMPILE64=aarch64-none-linux-gnu- CFG_ARM64_core=y CFG_WITH_SOFTWARE_PRNG=y PLATFORM=k3-am62lx -j8 CFG_TEE_CORE_LOG_LEVEL=2 CFG_TEE_CORE_DEBUG=y && cp out/arm-plat-k3/core/tee-pager_v2.bin ../bin/bl32.bin")


(setq uboot-r5-configure-cmd "make -j32 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabihf- am62x_evm_r5_defconfig O=./out/am62x/r5")

(setq uboot-r5-make-cmd "make -j8 -s CROSS_COMPILE=arm-none-linux-gnueabihf- BINMAN_INDIRS=../../../../ti-linux-firmware  O=./out/am62x/r5")

(setq uboot-configure-cmd "make CROSS_COMPILE=aarch64-none-linux-gnu- am62x_evm_a53_defconfig O=./out/am62x/a53")

(setq uboot-make-cmd "make -j8 -s CROSS_COMPILE=aarch64-none-linux-gnu- BL31=../../../../bin/am62x/bl31.bin BINMAN_INDIRS=../../../../ti-linux-firmware TEE=../../../../bin/am62x/bl32.bin O=./out/am62x/a53")

(setq uboot-run-cmd "export DFUPATH=1-7.3 && sudo dfu-util -p $DFUPATH -R -a bootloader -D out/am62x/r5/tiboot3.bin && sleep 2 && sudo dfu-util -p $DFUPATH -R -a tispl.bin -D out/am62x/a53/tispl.bin && sleep 2 && sudo dfu-util -p $DFUPATH -R -a u-boot.img -D out/am62x/a53/u-boot.img")

(setq kernel-configure-cmd "make -j8 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- defconfig")

(setq kernel-make-cmd "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- Image dtbs modules")

(setq kernel-modules-install-cmd "sudo make -j16 ARCH=arm64 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- INSTALL_MOD_PATH=/media/kamlesh/root modules_install")      

(setq relay-number "1")

(setq soft-reset "mw.l 43000030 243 1;mw.l 43018170 00000006 1")

(load "after-project.el")

(global-set-key (kbd "C-c 1") (lambda () (interactive)(if (get-buffer "usb4") (switch-to-buffer "usb4")(serial-usb4))))
(global-set-key (kbd "C-c 2") (lambda () (interactive)(if (get-buffer "usb5") (switch-to-buffer "usb5")(serial-usb5))))
(global-set-key (kbd "C-c 3") (lambda () (interactive)(if (get-buffer "usb6") (switch-to-buffer "usb6")(serial-usb6))))
(global-set-key (kbd "C-c 4") (lambda () (interactive)(if (get-buffer "usb7") (switch-to-buffer "usb7")(serial-usb7))))
