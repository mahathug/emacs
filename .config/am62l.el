(setq atf-make-cmd "make CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3low TARGET_BOARD=am62lx LOG_LEVEL=50 && cp build/k3low/am62lx/release/bl31.bin ../bin/bl31.bin")

(setq optee-make-cmd "make CROSS_COMPILE=arm-none-linux-gnueabihf- CROSS_COMPILE64=aarch64-none-linux-gnu- CFG_ARM64_core=y CFG_WITH_SOFTWARE_PRNG=y PLATFORM=k3-am62lx -j8 CFG_TEE_CORE_LOG_LEVEL=2 CFG_TEE_CORE_DEBUG=y && cp out/arm-plat-k3/core/tee-pager_v2.bin ../bin/bl32.bin")

(setq uboot-configure-cmd "make CROSS_COMPILE=aarch64-none-linux-gnu- am62lx_evm_defconfig")

(setq uboot-make-cmd "make -j8 CROSS_COMPILE=aarch64-none-linux-gnu- BL1=../bin/bl1.bin BL31=../bin/bl31.bin BINMAN_INDIRS=../ti-linux-firmware TEE=../bin/bl32.bin")

(setq uboot-run-cmd "export DFUPATH=1-13.3 && sudo dfu-util -p $DFUPATH -R -a bootloader -D tiboot3.bin && sleep 2 && sudo dfu-util -p $DFUPATH -R -a bootloader -D tispl.bin && sleep 2 && sudo dfu-util -p $DFUPATH -R -a u-boot.img -D u-boot.img")

(setq kernel-configure-cmd "make -j8 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- defconfig")

(setq kernel-make-cmd "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- Image dtbs modules")

(setq kernel-modules-install-cmd "sudo make -j16 ARCH=arm64 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- INSTALL_MOD_PATH=/media/kamlesh/root modules_install")      

(setq relay-number "0")

(setq soft-reset "mw.l 43010030 243 1;mw.l 43054000 00000006 1")
(load "after-project.el")

(global-set-key (kbd "C-c 1") (lambda () (interactive)(if (get-buffer "usb0") (switch-to-buffer "usb0")(serial-usb0))))
(global-set-key (kbd "C-c 2") (lambda () (interactive)(if (get-buffer "usb1") (switch-to-buffer "usb1")(serial-usb1))))
(global-set-key (kbd "C-c 3") (lambda () (interactive)(if (get-buffer "usb2") (switch-to-buffer "usb2")(serial-usb2))))
(global-set-key (kbd "C-c 4") (lambda () (interactive)(if (get-buffer "usb3") (switch-to-buffer "usb3")(serial-usb3))))

