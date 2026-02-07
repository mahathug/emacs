;;; gemini-code-config.el --- Configuration for Gemini Code

(require 'gemini-code)
(require 'gemini-code-transient)

;; Configure Gemini to use a regular window instead of a side window
(setq gemini-code-use-side-window nil)

;; Set the window display function to something that prefers a new window/split
;; (pop-to-buffer) is usually good enough as it splits or reuses another window.
;; You can customize display-buffer-alist here if you want more specific behavior.
(defun gemini-code-display-normal (buffer)
  "Display Gemini buffer in a normal window and focus it."
  (pop-to-buffer buffer)
  (get-buffer-window buffer))

(setq gemini-code-display-window-fn #'gemini-code-display-normal)

;; Key bindings
(global-set-key (kbd "C-c g") 'gemini-code-transient)

(provide 'gemini-code-config)
