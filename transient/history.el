((magit-am nil
	   ("--3way"))
 (magit-blame
  ("-w"))
 (magit-branch nil)
 (magit-cherry-pick
  ("--ff"))
 (magit-commit nil)
 (magit-dispatch nil)
 (magit-file-dispatch nil)
 (magit-format-patch:--output-directory)
 (magit-format-patch:--subject-prefix "tiL5.10-P PATCH v3" "tiL5.10-P RFC PATCH" "tiL5.10-P PATCH")
 (magit-log
  ("-n256" "--graph" "--decorate")
  ("-n256" "--decorate")
  ("-n256"
   ("--" "drivers/crypto/ti/mcrc.c")
   "--graph" "--decorate"))
 (magit-patch nil)
 (magit-patch-apply nil)
 (magit-patch-create
  ("--subject-prefix=tiL5.10-P PATCH v3" "--cover-letter" "--output-directory=/home/kamlesh/am62/mcrc/ti-linux-kernel/v35/")
  ("--subject-prefix=tiL5.10-P RFC PATCH" "--cover-letter" "--output-directory=/home/kamlesh/am62/mcrc/ti-linux-kernel/rfc/")
  ("--subject-prefix=tiL5.10-P PATCH"))
 (magit-pull nil)
 (magit-rebase
  ("--autostash")
  nil)
 (magit-reset nil)
 (magit-revert nil)
 (magit:-- "drivers/crypto/ti/mcrc.c" ""))
