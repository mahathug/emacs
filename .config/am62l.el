(setq atf-make-cmd "make CROSS_COMPILE=aarch64-none-linux-gnu- PLAT=k3 TARGET_BOARD=am62l LOG_LEVEL=50 SPD=opteed && cp build/k3/am62l/release/bl31.bin ../bin/bl31.bin")

(setq optee-make-cmd "make CROSS_COMPILE=arm-none-linux-gnueabihf- CROSS_COMPILE64=aarch64-none-linux-gnu- CFG_ARM64_core=y CFG_WITH_SOFTWARE_PRNG=y PLATFORM=k3-am62lx -j8 CFG_TEE_CORE_LOG_LEVEL=2 CFG_TEE_CORE_DEBUG=y && cp out/arm-plat-k3/core/tee-pager_v2.bin ../bin/bl32.bin")

(setq uboot-configure-cmd "make CROSS_COMPILE=aarch64-none-linux-gnu- am62lx_evm_defconfig")

(setq uboot-make-cmd "make -j8 -s CROSS_COMPILE=aarch64-none-linux-gnu- BL1=/home/kamlesh/am62/binman/am62l-wakeup/arm-trusted-firmware/build/k3/am62l/release/bl1.bin BL31=../bin/bl31.bin BINMAN_INDIRS=../ti-linux-firmware TEE=../bin/bl32.bin")

(setq uboot-run-cmd "sudo dfu-util -R -a bootloader -D tiboot3.bin && sleep 2 && sudo dfu-util -R -a bootloader -D tispl.bin && sleep 2 && sudo dfu-util -R -a u-boot.img -D u-boot.img")

(setq kernel-configure-cmd "make -j8 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- defconfig")

(setq kernel-make-cmd "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- Image dtbs modules")

(setq kernel-modules-install-cmd "sudo make -j16 ARCH=arm64 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- INSTALL_MOD_PATH=/home/kamlesh/root modules_install")      

