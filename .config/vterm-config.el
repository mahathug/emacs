;;; vterm-config.el --- My vterm setup -*- lexical-binding: t; -*-

;; C-c t → Open vterm instantly
;; C-c T → vterm in split window
;; C-c n → New named vterm session
;; C-c p → vterm in project root folder
;; C-c h → vterm in current folder
;; C-c m → Toggle between terminal/Emacs mode

;; Ensure vterm is installed
(use-package vterm
  :ensure t
  :commands (vterm vterm-other-window)
  :config
  ;; Faster scrolling
  (setq vterm-timer-delay 0.01)
  ;; Preserve directory tracking
  (setq vterm-tramp-shells '(("ssh" "/bin/bash")))
  ;; Better kill behavior
  (setq vterm-kill-buffer-on-exit t)
  ;; Cursor stays visible
  (setq vterm-always-compile-module t))

;; Quick keybindings
(global-set-key (kbd "C-c t") #'vterm)                ;; Open vterm
(global-set-key (kbd "C-c T") #'vterm-other-window)   ;; Open vterm in split

;; Named vterm sessions (super useful)
(defun kml/new-vterm-with-name ()
  "Create a new vterm and rename buffer."
  (interactive)
  (let* ((name (read-string "vterm name: "))
         (buf (generate-new-buffer (concat "vterm-" name))))
    (with-current-buffer buf
      (vterm-mode))
    (switch-to-buffer buf)))

(global-set-key (kbd "C-c n") #'kml/new-vterm-with-name)

;; Open vterm in project root
(defun kml/vterm-project-root ()
  (interactive)
  (let ((default-directory (project-root (project-current))))
    (vterm)))
(global-set-key (kbd "C-c p") #'kml/vterm-project-root)

;; Copy/Paste integration (very important)
(with-eval-after-load 'vterm
  (define-key vterm-mode-map (kbd "C-c C-y") #'vterm-yank)
  (define-key vterm-mode-map (kbd "C-c C-k") #'vterm-copy-mode))

;; Switch between terminal input mode <-> Emacs mode
(defun kml/vterm-toggle-mode ()
  "Toggle between vterm-char-mode and vterm-copy-mode."
  (interactive)
  (if (equal major-mode 'vterm-mode)
      (if vterm-copy-mode
          (vterm-copy-mode -1)
        (vterm-copy-mode 1))))
(global-set-key (kbd "C-c m") #'kml/vterm-toggle-mode)

;; Extra convenience: open vterm here
(defun kml/vterm-here ()
  (interactive)
  (let ((default-directory (expand-file-name default-directory)))
    (vterm)))
(global-set-key (kbd "C-c h") #'kml/vterm-here)

(provide 'vterm-config)
;;; vterm-config.el ends here
