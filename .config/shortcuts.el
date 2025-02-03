;; Alt shortcuts

(defun shortcuts-before-setup()
  (interactive)

  (global-set-key (kbd "M-i")(lambda() (interactive) (load-file "~/.emacs.d/init.el")))
  (global-set-key (kbd "M-o") 'dotemacs) )

(shortcuts-before-setup)
   
(defun shortcuts-after-setup()
  (interactive)
 

  (global-set-key (kbd "M-s") 'tags-search)

  
  (global-unset-key (kbd "M-<left>")) ;;
  (global-set-key (kbd "M-<left>") 'previous-buffer) ;
  (global-unset-key (kbd "M-<right>"))
  (global-set-key (kbd "M-<right>") 'next-buffer) ;
  
  (global-unset-key [menu])

  (global-unset-key [f2])

  (define-key cscope-minor-mode-keymap (kbd "<f2>") (lookup-key cscope-minor-mode-keymap (kbd "C-c s")))

  )

(shortcuts-after-setup)
