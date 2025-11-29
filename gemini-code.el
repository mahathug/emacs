;;; gemini-code.el --- Gemini Code Emacs integration -*- lexical-binding: t; -*-

;; Author: Gemini (Adapted from claude-code.el by Stephen Molitor)
;; Version: 0.1.0
;; Package-Requires: ((emacs "28.1") (transient "0.3.7") (inheritenv "0.2"))
;; Keywords: tools, ai
;; URL: https://github.com/google/gemini-code.el

;;; Commentary:
;; An Emacs interface to Gemini CLI. This package provides convenient
;; ways to interact with Gemini from within Emacs, including sending
;; commands, toggling the Gemini window, and context integration.

;;; Code:
(require 'transient)
(require 'project)
(require 'cl-lib)
(require 'inheritenv)

;;;; Customization options
(defgroup gemini-code nil
  "Gemini AI interface for Emacs."
  :group 'tools)

(defcustom gemini-code-program "gemini"
  "Program to run when starting Gemini.
Default is 'gemini'. Adjust if your executable is named differently."
  :type 'string
  :group 'gemini-code)

(defcustom gemini-code-program-switches nil
  "List of command line switches to pass to the Gemini program."
  :type '(repeat string)
  :group 'gemini-code)

(defcustom gemini-code-terminal-backend 'eat
  "Terminal backend to use for Gemini Code.
Choose between 'vterm (recommended) and 'eat terminal emulators."
  :type '(choice (const :tag "Vterm terminal emulator" vterm)
                 (const :tag "Eat terminal emulator" eat))
  :group 'gemini-code)

(defcustom gemini-code-window-side 'right
  "Side of the frame where the Gemini window should appear."
  :type '(choice (const :tag "Right" right)
                 (const :tag "Left" left)
                 (const :tag "Bottom" bottom)
                 (const :tag "Top" top))
  :group 'gemini-code)

(defcustom gemini-code-window-width 80
  "Width of the Gemini window when displayed on the side."
  :type 'integer
  :group 'gemini-code)

;;;; Internal variables
(defvar gemini-code--directory-buffer-map (make-hash-table :test 'equal)
  "Hash table mapping directories to Gemini buffers.")

(defvar gemini-code-command-history nil
  "History of commands sent to Gemini.")

;;;; Key bindings
(defvar gemini-code-command-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "c") 'gemini-code)
    (define-key map (kbd "t") 'gemini-code-toggle)
    (define-key map (kbd "r") 'gemini-code-send-region)
    (define-key map (kbd "s") 'gemini-code-send-command)
    (define-key map (kbd "b") 'gemini-code-switch-to-buffer)
    (define-key map (kbd "k") 'gemini-code-kill)
    map)
  "Keymap for Gemini commands.")

;;;; Helper Functions

(defun gemini-code--directory ()
  "Get the root directory for the current buffer context."
  (if-let ((project (project-current)))
      (expand-file-name (project-root project))
    (expand-file-name default-directory)))

(defun gemini-code--buffer-name (dir)
  "Generate buffer name for DIR."
  (format "*gemini-code:%s*" (file-name-nondirectory (directory-file-name dir))))

(defun gemini-code--ensure-backend ()
  (cond
   ((eq gemini-code-terminal-backend 'vterm)
    (unless (featurep 'vterm) (require 'vterm nil t)))
   ((eq gemini-code-terminal-backend 'eat)
    (unless (featurep 'eat) (require 'eat nil t)))))

(defun gemini-code--create-term (buffer-name program switches)
  "Create terminal buffer using configured backend."
  (gemini-code--ensure-backend)
  (let ((buffer (get-buffer-create buffer-name)))
    (with-current-buffer buffer
      (cond
       ((eq gemini-code-terminal-backend 'vterm)
        (unless (eq major-mode 'vterm-mode)
          (vterm-mode))
        (vterm-send-string (concat program " " (mapconcat 'identity switches " ") "\n")))
       
       ((eq gemini-code-terminal-backend 'eat)
        (unless (eq major-mode 'eat-mode)
          (eat-mode))
        (setq-local eat-term-name "xterm-256color")
        ;; Set environment variables:
        ;; NO_COLOR=1 to stop CLI from forcing bad colors
        ;; TERM/COLORFGBG for standard hints
        (let ((process-environment (append '("TERM=xterm-256color"
                                             "NO_COLOR=1"
                                             "COLORFGBG=15;0") 
                                           process-environment)))
          (eat-exec buffer buffer-name program nil switches))
        ;; Force default text to be bright white
        (face-remap-add-relative 'default :foreground "#ffffff")))
    buffer)))

(defun gemini-code--get-or-create-buffer ()
  "Get existing Gemini buffer for current project or create a new one."
  (let* ((dir (gemini-code--directory))
         (buf-name (gemini-code--buffer-name dir))
         (existing-buf (get-buffer buf-name)))
    (if (and existing-buf (buffer-live-p existing-buf))
        existing-buf
      (let ((default-directory dir))
        (gemini-code--create-term buf-name gemini-code-program gemini-code-program-switches)))))

(defun gemini-code--display-buffer (buffer)
  "Display BUFFER in a normal window."
  (pop-to-buffer buffer))

(defun gemini-code--send-string (buffer string)
  "Send STRING to terminal process in BUFFER."
  (with-current-buffer buffer
    (cond
     ((eq gemini-code-terminal-backend 'vterm)
      (vterm-send-string (concat string "\n")))
     ((eq gemini-code-terminal-backend 'eat)
      (eat-term-send-string eat-terminal (concat string "\n"))))))

;;;; Commands

;;;###autoload
(defun gemini-code ()
  "Start or switch to Gemini Code for the current project."
  (interactive)
  (let ((buffer (gemini-code--get-or-create-buffer)))
    (gemini-code--display-buffer buffer)
    (select-window (get-buffer-window buffer))))

;;;###autoload
(defun gemini-code-toggle ()
  "Toggle the Gemini Code window."
  (interactive)
  (let* ((dir (gemini-code--directory))
         (buf-name (gemini-code--buffer-name dir))
         (buffer (get-buffer buf-name)))
    (if (and buffer (get-buffer-window buffer))
        (delete-window (get-buffer-window buffer))
      (gemini-code))))

;;;###autoload
(defun gemini-code-send-command (command)
  "Send COMMAND to Gemini."
  (interactive (list (read-string "Gemini command: " nil 'gemini-code-command-history)))
  (let ((buffer (gemini-code--get-or-create-buffer)))
    (gemini-code--send-string buffer command)
    (gemini-code--display-buffer buffer)))

;;;###autoload
(defun gemini-code-send-region (start end &optional arg)
  "Send selected region to Gemini.
With prefix ARG, prompt for additional instructions."
  (interactive "r\nP")
  (let* ((text (buffer-substring-no-properties start end))
         (prompt (when arg (read-string "Instructions: ")))
         (message (if prompt (format "%s\n\n%s" prompt text) text)))
    (gemini-code-send-command message)))

;;;###autoload
(defun gemini-code-switch-to-buffer ()
  "Switch directly to the Gemini buffer."
  (interactive)
  (let ((buffer (gemini-code--get-or-create-buffer)))
    (pop-to-buffer buffer)))

;;;###autoload
(defun gemini-code-kill ()
  "Kill the Gemini session for current project."
  (interactive)
  (let* ((dir (gemini-code--directory))
         (buf-name (gemini-code--buffer-name dir))
         (buffer (get-buffer buf-name)))
    (when buffer
      (kill-buffer buffer)
      (message "Gemini session killed for %s" dir))))

;;;###autoload
(define-minor-mode gemini-code-mode
  "Minor mode for interacting with Gemini CLI."
  :lighter " Gemini"
  :global t
  :group 'gemini-code
  :keymap gemini-code-command-map)

(provide 'gemini-code)
;;; gemini-code.el ends here
