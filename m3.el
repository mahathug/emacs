;; --- COMMAND KEYS ---
(setq ns-command-modifier 'meta)        ;; Left Command -> Meta
(setq ns-right-command-modifier 'super) ;; Right Command -> Super

;; --- OPTION KEYS ---
(setq ns-option-modifier 'control)      ;; Left Option -> Control (Your new Control)
(setq ns-right-option-modifier 'none)   ;; Right Option -> None (allows binding)
(define-key global-map (kbd "<right-option>") (kbd "<f2>")) ;; Bind Right Option to F2

;; --- CONTROL KEYS ---
(setq ns-control-modifier 'control)    ;; Left Control -> Control (Default behavior)
(setq ns-right-control-modifier 'control) ;; Right Control -> Control (Default behavior)

;; Load Gemini Code integration
(load (expand-file-name "gemini-code.el" user-emacs-directory))

;; Configure Gemini to open in a normal window and ensure focus
(defun gemini-code-display-normal (buffer)
  "Display Gemini buffer in a normal window and focus it."
  (pop-to-buffer buffer)
  (get-buffer-window buffer))

(setq gemini-code-display-window-fn #'gemini-code-display-normal)

;; Optional: Bind keys
(global-set-key (kbd "C-c g") 'gemini-code-toggle)