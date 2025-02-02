;; Alt shortcuts

(defun shortcuts-before-setup()
  (interactive)

  (global-set-key (kbd "M-3") (lambda () (interactive)(setq working-project-path "~/am62/binman/am62l-wakeup/") (setq soc-type "hs-fs") (ti-setup )))
  (global-set-key (kbd "M-2") (lambda () (interactive)(setq working-project-path "~/am62/binman/am62lite-presil-build/") (setq soc-type "hs-fs")(ti-setup )))
  (global-set-key (kbd "M-5") (lambda () (interactive)(setq working-project-path "~/am62/binman/") (setq soc-type "hs-fs")(ti-setup )))
  (global-set-key (kbd "M-4") (lambda () (interactive)(setq working-project-path "~/upstream-test/") (setq soc-type "hs")    (setq soc-type "hs-fs") (setq sign-type "binman") (setq device am64x) (setq source mainline) (setq boot-type "mmc")(ti-setup )))
  (global-set-key (kbd "M-i")(lambda() (interactive) (load-file "~/.emacs.d/init.el")))
  (global-set-key (kbd "M-o") 'dotemacs) )

(shortcuts-before-setup)
   
(defun shortcuts-after-setup()
  (interactive)
 
  ;; (setq cscope_dir work_dir_1) ;;
  ;; (setq cscope-initial-directory cscope_dir) ;; ;;
  (global-set-key (kbd "M-1") (lambda () (interactive) (switch-to-buffer (find-file  (concat work_dir_1 "/")))))

  ;; (global-set-key (kbd "M-2") (lambda () (interactive) (if (string-equal work_dir_2 "gaia4-login") (gaia-csdcd4-login)(switch-to-buffer (find-file (concat work_dir_2 "/"))))))

  (global-set-key (kbd "M-2") (lambda () (interactive) (if (string-match-p "gaia" work_dir_2) (gaia-csdcd34-login)(switch-to-buffer (find-file (concat work_dir_2 "/"))))))


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
