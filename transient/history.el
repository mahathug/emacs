((magit-am
  ("--3way")
  nil)
 (magit-blame
  ("-w"))
 (magit-branch nil)
 (magit-cherry-pick
  ("--ff"))
 (magit-commit nil
	       ("--allow-empty"))
 (magit-dispatch nil)
 (magit-file-dispatch nil)
 (magit-format-patch:--output-directory)
 (magit-format-patch:--subject-prefix "PATCH" "tiU23.04 PATCH v2" "tiU23.04 PATCH" "PATCH v2" "tiL5.10-P PATCH v3" "tiL5.10-P RFC PATCH" "tiL5.10-P PATCH")
 (magit-gitignore nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
  ("-n256" "--grep=MCRC" "--graph" "--decorate")
  ("-n256" "--grep=mcrc" "--graph" "--decorate")
  ("-n256" "--author=Kamlesh Gurudasani <kamlesh@ti.com>" "--graph" "--decorate")
  ("-n256"
   ("--" "author=kamlesh")
   "--graph" "--decorate")
  ("-n256"
   ("--" "arch/arm64/boot/dts/ti/k3-am62-main.dtsi")
   "--graph" "--decorate")
  ("-n256" "--author=Manorit" "--graph" "--decorate")
  ("-n256"
   ("--" "configs/am64x_evm_a53_defconfig")
   "--graph" "--decorate")
  ("-n256"
   ("--" "arch/arm64/crypto/crc32-arm64.c")
   "--follow" "--graph" "--decorate")
  ("-n256"
   ("--" "arch/arm64/crypto/Kconfig")
   "--graph" "--decorate"))
 (magit-log:--grep "MCRC" "mcrc")
 (magit-patch nil)
 (magit-patch-apply nil)
 (magit-patch-create nil
		     ("--cover-letter" "--output-directory=/home/kamlesh/am62/mcrc/ti-linux-kernel/patches/dma-mcrc64/")
		     ("--output-directory=/home/kamlesh/am62/binman/linux-next/patches/mcrc-upstream/")
		     ("--subject-prefix=PATCH" "--output-directory=/home/kamlesh/am62/mainline/linux-next/patches/sa3ul-power-domain/v2/")
		     ("--subject-prefix=tiU23.04 PATCH v2" "--cover-letter" "--output-directory=/home/kamlesh/am62/binman/ti-u-boot/patches/fsstub-lpr/v2/")
		     ("--subject-prefix=tiU23.04 PATCH" "--cover-letter" "--output-directory=/home/kamlesh/am62/binman/ti-u-boot/patches/fsstub-lpr/v2/")
		     ("--subject-prefix=PATCH" "--cover-letter" "--output-directory=/home/kamlesh/am62/binman/ti-u-boot/patches/fsstub-lpr/v1-cp/")
		     ("--subject-prefix=PATCH" "--cover-letter" "--output-directory=/home/kamlesh/am62/binman/ti-u-boot/patches/fsstub-lpr/v1/")
		     ("--output-directory=/home/kamlesh/am62/binman/ti-u-boot/patches/fsstub/v1/")
		     ("--subject-prefix=PATCH"))
 (magit-pull nil)
 (magit-push nil)
 (magit-rebase nil
	       ("--keep-empty" "--autostash"))
 (magit-reset nil)
 (magit-revert nil)
 (magit-stash nil)
 (magit-submodule nil)
 (magit:-- "author=kamlesh" "" "arch/arm64/boot/dts/ti/k3-am62-main.dtsi" "configs/am64x_evm_a53_defconfig" "arch/arm64/crypto/crc32-arm64.c" "arch/arm64/crypto/Kconfig" "drivers/crypto/ti/mcrc.c")
 (magit:--author "Kamlesh Gurudasani <kamlesh@ti.com>" "Manorit" "manorit"))
