;;; gemini-code.el --- Gemini Code Emacs integration -*- lexical-binding: t; -*-

;; Author: Gemini (Adapted from claude-code.el by Stephen Molitor)
;; Version: 0.1.0
;; Package-Requires: ((emacs "28.1") (transient "0.3.7") (inheritenv "0.2"))
;; Keywords: tools, ai
;; URL: https://github.com/google/gemini-code.el

;;; Commentary:
;; An Emacs interface to Gemini Code.  This package provides convenient
;; ways to interact with Gemini from within Emacs, including sending
;; commands, toggling the Gemini window, and accessing slash commands.

;;; Code:
;;;; Require dependencies
(require 'transient)
(require 'project)
(require 'cl-lib)
(require 'inheritenv)

;;;; Customization options
(defgroup gemini-code nil
  "Gemini AI interface for Emacs."
  :group 'tools)

(defgroup gemini-code-eat nil
  "Eat terminal backend specific settings for Gemini Code."
  :group 'gemini-code)

(defgroup gemini-code-vterm nil
  "Vterm terminal backend specific settings for Gemini Code."
  :group 'gemini-code)

(defgroup gemini-code-window nil
  "Window management settings for Gemini Code."
  :group 'gemini-code)

(defface gemini-code-repl-face
  nil
  "Face for Gemini REPL."
  :group 'gemini-code)

(defcustom gemini-code-term-name "xterm-256color"
  "Terminal type to use for Gemini REPL."
  :type 'string
  :group 'gemini-code)

(defcustom gemini-code-start-hook nil
  "Hook run after Gemini is started."
  :type 'hook
  :group 'gemini-code)

(defcustom gemini-code-process-environment-functions nil
  "Abnormal hook for setting up and providing environment variables for Gemini.

Functions in this hook are called before starting Gemini and should
return a list of strings in the format \"VAR=VALUE\" to be added to the
process environment. All results from all functions will be concatenated
together.

Each function receives two arguments: the Gemini buffer name, and the
directory Gemini will be started in (typically the project root)."
  :type 'hook)

(defvar gemini-code-event-hook nil
  "Hook run when Gemini Code CLI triggers events.
Functions in this hook are called with one argument: a plist with :type and
:buffer-name keys.  Use `add-hook' and `remove-hook' to manage this hook.")

(defcustom gemini-code-startup-delay 0.1
  "Delay in seconds after starting Gemini before displaying buffer.

This helps fix terminal layout issues that can occur if the buffer
is displayed before Gemini is fully initialized."
  :type 'number
  :group 'gemini-code)

(defcustom gemini-code-large-buffer-threshold 100000
  "Size threshold in characters above which buffers are considered \"large\".

When sending a buffer to Gemini with `gemini-code-send-region` and no
region is active, prompt for confirmation if buffer size exceeds this value."
  :type 'integer
  :group 'gemini-code)

(defcustom gemini-code-program "gemini"
  "Program to run when starting Gemini.
This is passed as the PROGRAM parameter to `eat-make`."
  :type 'string
  :group 'gemini-code)

(defcustom gemini-code-program-switches nil
  "List of command line switches to pass to the Gemini program.
These are passed as SWITCHES parameters to `eat-make`."
  :type '(repeat string)
  :group 'gemini-code)

(defcustom gemini-code-sandbox-program nil
  "Program to run when starting Gemini in sandbox mode.
This must be set to the path of your Gemini sandbox binary before use."
  :type '(choice (const :tag "Not configured" nil) string)
  :group 'gemini-code)

(defcustom gemini-code-newline-keybinding-style 'newline-on-shift-return
  "Key binding style for entering newlines and sending messages.

This controls how the return key and its modifiers behave in Gemini buffers:
- \\='newline-on-shift-return: S-return enters a line break, RET sends the
  command (default)
- \\='newline-on-alt-return: M-return enters a line break, RET sends the command
- \\='shift-return-to-send: RET enters a line break, S-return sends the command
- \\='super-return-to-send: RET enters a line break, s-return sends the command

`\"S\"' is the shift key.
`\"s\"' is the hyper key, which is the COMMAND key on macOS."
  :type '(choice (const :tag "Newline on shift-return (s-return for newline, RET to send)" newline-on-shift-return)
                 (const :tag "Newline on alt-return (M-return for newline, RET to send)" newline-on-alt-return)
                 (const :tag "Shift-return to send (RET for newline, S-return to send)" shift-return-to-send)
                 (const :tag "Super-return to send (RET for newline, s-return to send)" super-return-to-send))
  :group 'gemini-code)

(defcustom gemini-code-enable-notifications t
  "Whether to show notifications when Gemini finishes and awaits input."
  :type 'boolean
  :group 'gemini-code)

(defcustom gemini-code-notification-function 'gemini-code-default-notification
  "Function to call for notifications.

The function is called with two arguments:
- TITLE: Title of the notification
- MESSAGE: Body of the notification"
  :type 'function
  :group 'gemini-code)

(defcustom gemini-code-confirm-kill t
  "Whether to ask for confirmation before killing Gemini instances."
  :type 'boolean
  :group 'gemini-code)

(defcustom gemini-code-optimize-window-resize t
  "Whether to optimize terminal window resizing to prevent unnecessary reflows."
  :type 'boolean
  :group 'gemini-code)

(defcustom gemini-code-terminal-backend 'eat
  "Terminal backend to use for Gemini Code.
Choose between \\='eat (default) and \\='vterm terminal emulators."
  :type '(radio (const :tag "Eat terminal emulator" eat)
                (const :tag "Vterm terminal emulator" vterm))
  :group 'gemini-code)

(defcustom gemini-code-no-delete-other-windows nil
  "Whether to prevent Gemini Code windows from being deleted."
  :type 'boolean
  :group 'gemini-code-window)

(defcustom gemini-code-toggle-auto-select nil
  "Whether to automatically select the Gemini buffer after toggling it open."
  :type 'boolean
  :group 'gemini-code-window)

;;;;; Eat terminal customizations
(defface gemini-code-eat-prompt-annotation-running-face
  '((t :inherit eat-shell-prompt-annotation-running))
  "Face for running prompt annotations in Gemini eat terminal."
  :group 'gemini-code-eat)

(defface gemini-code-eat-prompt-annotation-success-face
  '((t :inherit eat-shell-prompt-annotation-success))
  "Face for successful prompt annotations in Gemini eat terminal."
  :group 'gemini-code-eat)

(defface gemini-code-eat-prompt-annotation-failure-face
  '((t :inherit eat-shell-prompt-annotation-failure))
  "Face for failed prompt annotations in Gemini eat terminal."
  :group 'gemini-code-eat)

(defface gemini-code-eat-term-bold-face
  '((t :inherit eat-term-bold))
  "Face for bold text in Gemini eat terminal."
  :group 'gemini-code-eat)

(defface gemini-code-eat-term-faint-face
  '((t :inherit eat-term-faint))
  "Face for faint text in Gemini eat terminal."
  :group 'gemini-code-eat)

(defface gemini-code-eat-term-italic-face
  '((t :inherit eat-term-italic))
  "Face for italic text in Gemini eat terminal."
  :group 'gemini-code-eat)

(defface gemini-code-eat-term-slow-blink-face
  '((t :inherit eat-term-slow-blink))
  "Face for slow blinking text in Gemini eat terminal."
  :group 'gemini-code-eat)

(defface gemini-code-eat-term-fast-blink-face
  '((t :inherit eat-term-fast-blink))
  "Face for fast blinking text in Gemini eat terminal."
  :group 'gemini-code-eat)

(dotimes (i 10)
  (let ((face-name (intern (format "gemini-code-eat-term-font-%d-face" i)))
        (eat-face (intern (format "eat-term-font-%d" i))))
    (eval `(defface ,face-name
             '((t :inherit ,eat-face))
             ,(format "Face for font %d in Gemini eat terminal." i)
             :group 'gemini-code-eat))))

(defcustom gemini-code-eat-read-only-mode-cursor-type '(box nil nil)
  "Type of cursor to use as invisible cursor in Gemini Code terminal buffer."
  :type 'list
  :group 'gemini-code-eat)

(defcustom gemini-code-eat-never-truncate-gemini-buffer nil
  "When non-nil, disable truncation of Gemini output buffer."
  :type 'boolean
  :group 'gemini-code-eat)

;;;;; Vterm terminal customizations
(defcustom gemini-code-vterm-buffer-multiline-output t
  "Whether to buffer vterm output to prevent flickering on multi-line input."
  :type 'boolean
  :group 'gemini-code-vterm)

(defcustom gemini-code-vterm-multiline-delay 0.01
  "Delay in seconds before processing buffered vterm output."
  :type 'number
  :group 'gemini-code-vterm)

;;;; Forward declarations for flycheck
(declare-function flycheck-overlay-errors-at "flycheck")
(declare-function flycheck-error-filename "flycheck")
(declare-function flycheck-error-line "flycheck")
(declare-function flycheck-error-message "flycheck")

;;;; Forward declarations for server
(defvar server-eval-args-left)

;;;; Internal state variables
(defvar gemini-code--directory-buffer-map (make-hash-table :test 'equal)
  "Hash table mapping directories to user-selected Gemini buffers.")

(defvar gemini-code--window-widths nil
  "Hash table mapping windows to their last known widths for eat terminals.")

(defvar gemini-code-command-history nil
  "History of commands sent to Gemini.")

;;;; Key bindings
(defvar gemini-code-command-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "/") 'gemini-code-slash-commands)
    (define-key map (kbd "b") 'gemini-code-switch-to-buffer)
    (define-key map (kbd "B") 'gemini-code-select-buffer)
    (define-key map (kbd "c") 'gemini-code)
    (define-key map (kbd "C") 'gemini-code-continue)
    (define-key map (kbd "R") 'gemini-code-resume)
    (define-key map (kbd "i") 'gemini-code-new-instance)
    (define-key map (kbd "d") 'gemini-code-start-in-directory)
    (define-key map (kbd "e") 'gemini-code-fix-error-at-point)
    (define-key map (kbd "k") 'gemini-code-kill)
    (define-key map (kbd "K") 'gemini-code-kill-all)
    (define-key map (kbd "m") 'gemini-code-transient)
    (define-key map (kbd "n") 'gemini-code-send-escape)
    (define-key map (kbd "f") 'gemini-code-fork)
    (define-key map (kbd "r") 'gemini-code-send-region)
    (define-key map (kbd "s") 'gemini-code-send-command)
    (define-key map (kbd "S") 'gemini-code-sandbox)
    (define-key map (kbd "t") 'gemini-code-toggle)
    (define-key map (kbd "x") 'gemini-code-send-command-with-context)
    (define-key map (kbd "y") 'gemini-code-send-return)
    (define-key map (kbd "z") 'gemini-code-toggle-read-only-mode)
    (define-key map (kbd "1") 'gemini-code-send-1)
    (define-key map (kbd "2") 'gemini-code-send-2)
    (define-key map (kbd "3") 'gemini-code-send-3)
    (define-key map (kbd "M") 'gemini-code-cycle-mode)
    (define-key map (kbd "o") 'gemini-code-send-buffer-file)
    map)
  "Keymap for Gemini commands.")

;;;; Transient Menus
;;;###autoload
(transient-define-prefix gemini-code-transient ()
  "Gemini command menu."
  ["Gemini Commands"
   ["Start/Stop Gemini"
    ("c" "Start Gemini" gemini-code)
    ("S" "Start Gemini (sandbox)" gemini-code-sandbox)
    ("d" "Start in directory" gemini-code-start-in-directory)
    ("C" "Continue conversation" gemini-code-continue)
    ("R" "Resume session" gemini-code-resume)
    ("i" "New instance" gemini-code-new-instance)
    ("k" "Kill Gemini" gemini-code-kill)
    ("K" "Kill all Gemini instances" gemini-code-kill-all)
    ]
   ["Send Commands to Gemini"
    ("s" "Send command" gemini-code-send-command)
    ("x" "Send command with context" gemini-code-send-command-with-context)
    ("r" "Send region or buffer" gemini-code-send-region)
    ("o" "Send buffer file" gemini-code-send-buffer-file)
    ("e" "Fix error at point" gemini-code-fix-error-at-point)
    ("f" "Fork conversation" gemini-code-fork)
    ("/" "Slash Commands" gemini-code-slash-commands)]
   ["Manage Gemini"
    ("t" "Toggle gemini window" gemini-code-toggle)
    ("b" "Switch to Gemini buffer" gemini-code-switch-to-buffer)
    ("B" "Select from all Gemini buffers" gemini-code-select-buffer)
    ("z" "Toggle read-only mode" gemini-code-toggle-read-only-mode)
    ("M" "Cycle Gemini mode" gemini-code-cycle-mode :transient t)
    ]
   ["Quick Responses"
    ("y" "Send <return>" gemini-code-send-return)
    ("n" "Send <escape>" gemini-code-send-escape)
    ("1" "Send \"1\"" gemini-code-send-1)
    ("2" "Send \"2\"" gemini-code-send-2)
    ("3" "Send \"3\"" gemini-code-send-3)
    ]])

;;;###autoload
(transient-define-prefix gemini-code-slash-commands ()
  "Gemini slash commands menu."
  ["Slash Commands"
   ["Core Commands"
    ("h" "Help" (lambda () (interactive) (gemini-code--do-send-command "/help")))
    ("c" "Clear" (lambda () (interactive) (gemini-code--do-send-command "/clear")))
    ("C" "Compact" (lambda () (interactive) (gemini-code--do-send-command "/compact")))
    ("s" "Status" (lambda () (interactive) (gemini-code--do-send-command "/status")))
    ("d" "Doctor" (lambda () (interactive) (gemini-code--do-send-command "/doctor")))]
   ])

;;;; Terminal abstraction layer

(cl-defgeneric gemini-code--term-make (backend buffer-name program &optional switches)
  "Create a terminal using BACKEND in BUFFER-NAME running PROGRAM.")

(cl-defgeneric gemini-code--term-send-string (backend terminal string)
  "Send STRING to TERMINAL using BACKEND.")

(cl-defgeneric gemini-code--term-kill-process (backend buffer)
  "Kill the terminal process in BUFFER using BACKEND.")

(cl-defgeneric gemini-code--term-read-only-mode (backend)
  "Switch current terminal to read-only mode using BACKEND.")

(cl-defgeneric gemini-code--term-interactive-mode (backend)
  "Switch current terminal to interactive mode using BACKEND.")

(cl-defgeneric gemini-code--term-in-read-only-p (backend)
  "Check if current terminal is in read-only mode using BACKEND.")

(cl-defgeneric gemini-code--term-configure (backend)
  "Configure terminal in current buffer with BACKEND specific settings.")

(cl-defgeneric gemini-code--term-customize-faces (backend)
  "Apply face customizations for the terminal using BACKEND.")

(cl-defgeneric gemini-code--term-setup-keymap (backend)
  "Set up the local keymap for Gemini Code buffers using BACKEND.")

(cl-defgeneric gemini-code--term-get-adjust-process-window-size-fn (backend)
  "Get the BACKEND specific function that adjusts window size.")

;;;;; eat backend implementations

(defvar eat--semi-char-mode)
(defvar eat--synchronize-scroll-function)
(defvar eat-invisible-cursor-type)
(defvar eat-term-name)
(defvar eat-terminal)
(declare-function eat--adjust-process-window-size "eat" (&rest args))
(declare-function eat--set-cursor "eat" (terminal &rest args))
(declare-function eat-emacs-mode "eat")
(declare-function eat-kill-process "eat" (&optional buffer))
(declare-function eat-make "eat" (name program &optional startfile &rest switches))
(declare-function eat-semi-char-mode "eat")
(declare-function eat-term-display-beginning "eat" (terminal))
(declare-function eat-term-display-cursor "eat" (terminal))
(declare-function eat-term-live-p "eat" (terminal))
(declare-function eat-term-parameter "eat" (terminal parameter) t)
(declare-function eat-term-redisplay "eat" (terminal))
(declare-function eat-term-reset "eat" (terminal))
(declare-function eat-term-send-string "eat" (terminal string))

(defun gemini-code--ensure-eat ()
  "Ensure eat package is loaded."
  (unless (featurep 'eat)
    (unless (require 'eat nil t)
      (error "The eat package is required. Please install it"))))

(cl-defmethod gemini-code--term-make ((_backend (eql eat)) buffer-name program &optional switches)
  (gemini-code--ensure-eat)
  (let* ((trimmed-buffer-name (string-trim-right (string-trim buffer-name "\\*") "\\*")))
    ;; Set environment variables here to ensure they apply to the new process
    (let ((process-environment (append '("TERM=xterm-256color" 
                                         "COLORFGBG=15;0" 
                                         "NO_COLOR=1") 
                                       process-environment)))
      (apply #'eat-make trimmed-buffer-name program nil switches))))

(cl-defmethod gemini-code--term-send-string ((_backend (eql eat)) string)
  (eat-term-send-string eat-terminal string))

(cl-defmethod gemini-code--term-kill-process ((_backend (eql eat)) buffer)
  (with-current-buffer buffer
    (eat-kill-process)
    (kill-buffer buffer)))

(cl-defmethod gemini-code--term-read-only-mode ((_backend (eql eat)))
  (gemini-code--ensure-eat)
  (eat-emacs-mode)
  (setq-local eat-invisible-cursor-type gemini-code-eat-read-only-mode-cursor-type)
  (eat--set-cursor nil :invisible))

(cl-defmethod gemini-code--term-interactive-mode ((_backend (eql eat)))
  (gemini-code--ensure-eat)
  (eat-semi-char-mode)
  (setq-local eat-invisible-cursor-type nil)
  (eat--set-cursor nil :invisible))

(cl-defmethod gemini-code--term-in-read-only-p ((_backend (eql eat)))
  (not eat--semi-char-mode))

(defun gemini-code--eat-synchronize-scroll (windows)
  "Synchronize scrolling and point between terminal and WINDOWS."
  (dolist (window windows)
    (if (eq window 'buffer)
        (goto-char (eat-term-display-cursor eat-terminal))
      (when (not buffer-read-only)
        (let ((cursor-pos (eat-term-display-cursor eat-terminal)))
          (set-window-point window cursor-pos)
          (cond
           ((>= cursor-pos (- (point-max) 2))
            (with-selected-window window
              (goto-char cursor-pos)
              (recenter -1)))
           ((not (pos-visible-in-window-p cursor-pos window))
            (with-selected-window window
              (goto-char cursor-pos)
              (recenter)))))))))

(cl-defmethod gemini-code--term-configure ((_backend (eql eat)))
  (gemini-code--ensure-eat)
  (setq-local eat-term-name gemini-code-term-name)
  (setq-local eat-enable-directory-tracking nil)
  (setq-local eat-enable-shell-command-history nil)
  (setq-local eat-enable-shell-prompt-annotation nil)
  (when gemini-code-eat-never-truncate-gemini-buffer
    (setq-local eat-term-scrollback-size nil))
  (setq-local eat--synchronize-scroll-function #'gemini-code--eat-synchronize-scroll)
  (when (bound-and-true-p eat-terminal)
    (eval '(setf (eat-term-parameter eat-terminal 'ring-bell-function) #'gemini-code--notify)))
  (sleep-for gemini-code-startup-delay))

(cl-defmethod gemini-code--term-customize-faces ((_backend (eql eat)))
  ;; Remap faces if needed
  )

(cl-defmethod gemini-code--term-setup-keymap ((_backend (eql eat)))
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map (current-local-map))
    (define-key map (kbd "C-g") #'gemini-code-send-escape)
    (use-local-map map)))

(cl-defmethod gemini-code--term-get-adjust-process-window-size-fn ((_backend (eql eat)))
  #'eat--adjust-process-window-size)

;;;;; vterm backend implementations

(defvar vterm-buffer-name)
(defvar vterm-copy-mode)
(defvar vterm-environment)
(defvar vterm-shell)
(defvar vterm-term-environment-variable)
(declare-function vterm "vterm" (&optional buffer-name))
(declare-function vterm--window-adjust-process-window-size "vterm" (process window))
(declare-function vterm-copy-mode "vterm" (&optional arg))
(declare-function vterm-mode "vterm")
(declare-function vterm-send-key "vterm" key &optional shift meta ctrl accept-proc-output)
(declare-function vterm-send-string "vterm" (string &optional paste-p))

(cl-defmethod gemini-code--term-make ((_backend (eql vterm)) buffer-name program &optional switches)
  (gemini-code--ensure-vterm)
  (let* ((vterm-shell (if switches
                          (concat program " " (mapconcat #'identity switches " "))
                        program))
         (buffer (get-buffer-create buffer-name)))
    (inheritenv
     (with-current-buffer buffer
        (pop-to-buffer buffer)
        (vterm-mode)
        (delete-window (get-buffer-window buffer))
        buffer))))

(defun gemini-code--ensure-vterm ()
  (unless (and (require 'vterm nil t) (featurep 'vterm))
    (error "The vterm package is required. Please install it")))

(cl-defmethod gemini-code--term-send-string ((_backend (eql vterm)) string)
  (vterm-send-string string))

(cl-defmethod gemini-code--term-kill-process ((_backend (eql vterm)) buffer)
  (kill-process (get-buffer-process buffer)))

(cl-defmethod gemini-code--term-read-only-mode ((_backend (eql vterm)))
  (gemini-code--ensure-vterm)
  (vterm-copy-mode 1)
  (setq-local cursor-type t))

(cl-defmethod gemini-code--term-interactive-mode ((_backend (eql vterm)))
  (gemini-code--ensure-vterm)
  (vterm-copy-mode -1)
  (setq-local cursor-type nil))

(cl-defmethod gemini-code--term-in-read-only-p ((_backend (eql vterm)))
  vterm-copy-mode)

(cl-defmethod gemini-code--term-configure ((_backend (eql vterm)))
  (gemini-code--ensure-vterm)
  (setq vterm-term-environment-variable gemini-code-term-name)
  (setq-local vterm-buffer-name-string nil)
  (setq-local vterm-scroll-to-bottom-on-output nil)
  (setq-local vterm--redraw-immididately nil)
  (setq-local cursor-in-non-selected-windows nil)
  (setq-local blink-cursor-mode nil)
  (setq-local cursor-type nil)
  (when-let ((proc (get-buffer-process (current-buffer))))
    (set-process-query-on-exit-flag proc nil)
    (process-put proc 'read-output-max 4096)))

(cl-defmethod gemini-code--term-customize-faces ((_backend (eql vterm)))
  )

(cl-defmethod gemini-code--term-setup-keymap ((_backend (eql vterm)))
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map (current-local-map))
    (use-local-map map)))

(cl-defmethod gemini-code--term-get-adjust-process-window-size-fn ((_backend (eql vterm)))
  #'vterm--window-adjust-process-window-size)

;;;; Private util functions

(defmacro gemini-code--with-buffer (&rest body)
  `(if-let ((gemini-code-buffer (gemini-code--get-or-prompt-for-buffer)))
       (with-current-buffer gemini-code-buffer
         ,@body
         (display-buffer gemini-code-buffer))
     (gemini-code--show-not-running-message)))

(defun gemini-code--buffer-p (buffer)
  (let ((name (if (stringp buffer) buffer (buffer-name buffer))))
    (and name (string-match-p "^\\*gemini-code:" name))))

(defun gemini-code--directory ()
  (let* ((project (project-current))
         (current-file (buffer-file-name)))
    (cond
     (project (project-root project))
     (current-file (file-name-directory current-file))
     (t default-directory))))

(defun gemini-code--find-all-gemini-buffers ()
  (cl-remove-if-not #'gemini-code--buffer-p (buffer-list)))

(defun gemini-code--find-gemini-buffers-for-directory (directory)
  (cl-remove-if-not
   (lambda (buf)
     (let ((buf-dir (gemini-code--extract-directory-from-buffer-name (buffer-name buf))))
       (and buf-dir
            (string= (file-truename (abbreviate-file-name directory))
                     (file-truename buf-dir)))))
   (gemini-code--find-all-gemini-buffers)))

(defun gemini-code--extract-directory-from-buffer-name (buffer-name)
  (when (string-match "^\\*gemini-code:\\([^:]+\\)\\(?::\\([^*]+\\)\\)?\\*$" buffer-name)
    (match-string 1 buffer-name)))

(defun gemini-code--extract-instance-name-from-buffer-name (buffer-name)
  (when (string-match "^\\*gemini-code:\\([^:]+\\)\\(?::\\([^*]+\\)\\)?\\*$" buffer-name)
    (match-string 2 buffer-name)))

(defun gemini-code--buffer-display-name (buffer)
  (let* ((name (buffer-name buffer))
         (dir (gemini-code--extract-directory-from-buffer-name name))
         (instance-name (gemini-code--extract-instance-name-from-buffer-name name)))
    (if instance-name
        (format "%s:%s (%s)" (file-name-nondirectory (directory-file-name dir)) instance-name dir)
      (format "%s (%s)" (file-name-nondirectory (directory-file-name dir)) dir))))

(defun gemini-code--buffers-to-choices (buffers &optional simple-format)
  (mapcar (lambda (buf)
            (let ((display-name (if simple-format
                                    (or (gemini-code--extract-instance-name-from-buffer-name (buffer-name buf)) "default")
                                  (gemini-code--buffer-display-name buf))))
              (cons display-name buf)))
          buffers))

(defun gemini-code--select-buffer-from-choices (prompt buffers &optional simple-format)
  (when buffers
    (let* ((choices (gemini-code--buffers-to-choices buffers simple-format))
           (selection (completing-read prompt (mapcar #'car choices) nil t)))
      (cdr (assoc selection choices)))))

(defun gemini-code--prompt-for-gemini-buffer ()
  (let* ((current-dir (gemini-code--directory))
         (gemini-buffers (gemini-code--find-all-gemini-buffers)))
    (when gemini-buffers
      (let* ((prompt (format "Select Gemini instance for %s: " (abbreviate-file-name current-dir)))
             (selected-buffer (gemini-code--select-buffer-from-choices prompt gemini-buffers)))
        (when selected-buffer
          (puthash current-dir selected-buffer gemini-code--directory-buffer-map))
        selected-buffer))))

(defun gemini-code--get-or-prompt-for-buffer ()
  (let* ((current-dir (gemini-code--directory))
         (dir-buffers (gemini-code--find-gemini-buffers-for-directory current-dir)))
    (cond
     ((> (length dir-buffers) 1)
      (gemini-code--select-buffer-from-choices
       (format "Select Gemini instance for %s: " (abbreviate-file-name current-dir))
       dir-buffers t))
     ((= (length dir-buffers) 1) (car dir-buffers))
     (t (let ((remembered-buffer (gethash current-dir gemini-code--directory-buffer-map)))
          (if (and remembered-buffer (buffer-live-p remembered-buffer))
              remembered-buffer
            (let ((other-buffers (gemini-code--find-all-gemini-buffers)))
              (when other-buffers (gemini-code--prompt-for-gemini-buffer)))))))))

(defun gemini-code--buffer-name (&optional instance-name)
  (let ((dir (gemini-code--directory)))
    (if dir
        (if instance-name
            (format "*gemini-code:%s:%s*" (abbreviate-file-name (file-truename dir)) instance-name)
          (format "*gemini-code:%s*" (abbreviate-file-name (file-truename dir))))
      (error "Cannot determine Gemini directory"))))

(defun gemini-code--prompt-for-instance-name (dir existing-instance-names &optional force-prompt)
  (if (or existing-instance-names force-prompt)
      (read-string (format "Instance name for %s: " (abbreviate-file-name dir)))
    "default"))

(defun gemini-code--show-not-running-message ()
  (message "Gemini is not running"))

(defun gemini-code--kill-buffer (buffer)
  (when (buffer-live-p buffer)
    (with-current-buffer buffer
      (when gemini-code-optimize-window-resize
        (advice-remove (gemini-code--term-get-adjust-process-window-size-fn gemini-code-terminal-backend) #'gemini-code--adjust-window-size-advice))
      (when gemini-code--window-widths (clrhash gemini-code--window-widths))
      (gemini-code--term-kill-process gemini-code-terminal-backend buffer))))

(defun gemini-code--cleanup-directory-mapping ()
  (let ((dying-buffer (current-buffer)))
    (maphash (lambda (dir buffer)
               (when (eq buffer dying-buffer)
                 (remhash dir gemini-code--directory-buffer-map)))
             gemini-code--directory-buffer-map)))

(defun gemini-code--get-buffer-file-name ()
  (when buffer-file-name (file-local-name (file-truename buffer-file-name))))

(defun gemini-code--format-file-reference (&optional file-name line-start line-end)
  (let ((file (or file-name (gemini-code--get-buffer-file-name)))
        (start (or line-start (line-number-at-pos nil t)))
        (end line-end))
    (when file
      (if end (format "@%s:%d-%d" file start end) (format "@%s:%d" file start)))))

(defun gemini-code--do-send-command (cmd)
  (if-let ((gemini-code-buffer (gemini-code--get-or-prompt-for-buffer)))
      (progn
        (with-current-buffer gemini-code-buffer
          (gemini-code--term-send-string gemini-code-terminal-backend cmd)
          (sit-for 0.1)
          (gemini-code--term-send-string gemini-code-terminal-backend (kbd "RET"))
          (display-buffer gemini-code-buffer))
        gemini-code-buffer)
    (gemini-code--show-not-running-message)
    nil))

(defun gemini-code-display-buffer-below (buffer)
  (display-buffer buffer '((display-buffer-below-selected))))

(defcustom gemini-code-display-window-fn #'gemini-code-display-buffer-below
  "Function used to display the gemini code window."
  :type 'function)

(defun gemini-code--start (arg extra-switches &optional force-prompt force-switch-to-buffer)
  (let* ((dir (if (equal arg '(16)) (read-directory-name "Project directory: ") (gemini-code--directory)))
         (switch-after (or (equal arg '(4)) force-switch-to-buffer))
         (default-directory dir)
         (existing-buffers (gemini-code--find-gemini-buffers-for-directory dir))
         (existing-instance-names (mapcar (lambda (buf) (or (gemini-code--extract-instance-name-from-buffer-name (buffer-name buf)) "default")) existing-buffers))
         (instance-name (gemini-code--prompt-for-instance-name dir existing-instance-names force-prompt))
         (buffer-name (gemini-code--buffer-name instance-name))
         (program-switches (if extra-switches (append gemini-code-program-switches extra-switches) gemini-code-program-switches))
         (process-adaptive-read-buffering nil)
         (process-environment (append `(,(format "GEMINI_BUFFER_NAME=%s" buffer-name)) process-environment))
         (buffer (gemini-code--term-make gemini-code-terminal-backend buffer-name gemini-code-program program-switches)))

    (unless (executable-find gemini-code-program)
      (error "Gemini Code program '%s' not found in PATH" gemini-code-program))
    (unless (buffer-live-p buffer)
      (error "Failed to create Gemini Code buffer"))

    (with-current-buffer buffer
      (gemini-code--term-configure gemini-code-terminal-backend)
      (setq gemini-code--window-widths (make-hash-table :test 'eq :weakness 'key))
      (when gemini-code-optimize-window-resize
        (advice-add (gemini-code--term-get-adjust-process-window-size-fn gemini-code-terminal-backend) :around #'gemini-code--adjust-window-size-advice))
      (gemini-code--term-setup-keymap gemini-code-terminal-backend)
      (gemini-code--term-customize-faces gemini-code-terminal-backend)
      (face-remap-add-relative 'nobreak-space :underline nil)
      (buffer-face-set :inherit 'gemini-code-repl-face)
      (setq-local vertical-scroll-bar nil)
      (setq-local fringe-mode 0)
      (add-hook 'kill-buffer-hook #'gemini-code--cleanup-directory-mapping nil t)
      (run-hooks 'gemini-code-start-hook)
      (let ((window (funcall gemini-code-display-window-fn buffer)))
        (when window
          (set-window-parameter window 'left-margin-width 0)
          (set-window-parameter window 'right-margin-width 0)
          (set-window-parameter window 'left-fringe-width 0)
          (set-window-parameter window 'right-fringe-width 0)
          (set-window-parameter window 'no-delete-other-windows gemini-code-no-delete-other-windows))))
    (when switch-after (pop-to-buffer buffer))))

(defun gemini-code--adjust-window-size-advice (orig-fun &rest args)
  (let ((result (apply orig-fun args)))
    (let ((width-changed nil))
      (dolist (window (window-list))
        (let ((buffer (window-buffer window)))
          (when (and buffer (gemini-code--buffer-p buffer))
            (let ((current-width (window-width window))
                  (stored-width (gethash window gemini-code--window-widths)))
              (when (or (not stored-width) (/= current-width stored-width))
                (setq width-changed t)
                (puthash window current-width gemini-code--window-widths))))))
      (if (not (gemini-code--buffer-p (current-buffer)))
          result
        (if (and width-changed (not (gemini-code--term-in-read-only-p gemini-code-terminal-backend)))
            result nil)))))

(defun gemini-code--notify (_terminal)
  (when gemini-code-enable-notifications
    (funcall gemini-code-notification-function "Gemini Ready" "Waiting for your response")))

(defun gemini-code-default-notification (title message)
  (message "%s: %s" title message))

;;;; Interactive Commands
;;;###autoload
(defun gemini-code (&optional arg)
  "Start Gemini in terminal.
With single prefix ARG, switch to buffer after creating.
With double prefix ARG, prompt for the project directory."
  (interactive "P")
  (gemini-code--start arg nil))

;;;###autoload
(defun gemini-code-start-in-directory (&optional arg)
  "Prompt for a directory and start Gemini there."
  (interactive "P")
  (let ((dir (read-directory-name "Project directory: ")))
    (cl-letf (((symbol-function 'gemini-code--directory) (lambda () dir)))
      (gemini-code (when arg '(4))))))

;;;###autoload
(defun gemini-code-continue (&optional arg)
  "Start Gemini and continue the previous conversation."
  (interactive "P")
  (gemini-code--start arg '("--continue")))

;;;###autoload
(defun gemini-code-resume (arg)
  "Resume a specific Gemini session."
  (interactive "P")
  (let ((extra-switches '("--resume")))
    (gemini-code--start arg extra-switches nil t))
  (gemini-code--term-send-string gemini-code-terminal-backend "")
  (goto-char (point-min)))

;;;###autoload
(defun gemini-code-new-instance (&optional arg)
  "Create a new Gemini instance, prompting for instance name."
  (interactive "P")
  (gemini-code--start arg nil t))

;;;###autoload
(defun gemini-code-sandbox (&optional arg)
  "Start Gemini in sandbox mode."
  (interactive "P")
  (unless gemini-code-sandbox-program
    (error "Gemini-code-sandbox-program is not configured"))
  (let* ((skip-permissions (y-or-n-p "Skip permissions (--dangerously-skip-permissions)? "))
         (gemini-code-program gemini-code-sandbox-program)
         (gemini-code-program-switches (if skip-permissions (append gemini-code-program-switches '("--dangerously-skip-permissions")) gemini-code-program-switches)))
    (gemini-code arg)))

;;;###autoload
(defun gemini-code-send-region (&optional arg)
  "Send the current region to Gemini."
  (interactive "P")
  (let* ((text (if (use-region-p) (buffer-substring-no-properties (region-beginning) (region-end))
                 (if (> (buffer-size) gemini-code-large-buffer-threshold)
                     (when (yes-or-no-p "Buffer is large. Send anyway? ") (buffer-substring-no-properties (point-min) (point-max)))
                   (buffer-substring-no-properties (point-min) (point-max)))))
         (prompt (cond ((equal arg '(4)) (read-string "Instructions: ")) ((equal arg '(16)) (read-string "Instructions: ")) (t nil)))
         (full-text (if prompt (format "%s\n\n%s" prompt text) text)))
    (when full-text
      (let ((selected-buffer (gemini-code--do-send-command full-text)))
        (when (and (equal arg '(16)) selected-buffer) (pop-to-buffer selected-buffer))))))

;;;###autoload
(defun gemini-code-toggle ()
  "Show or hide the Gemini window."
  (interactive)
  (let ((gemini-code-buffer (gemini-code--get-or-prompt-for-buffer)))
    (if gemini-code-buffer
        (if (get-buffer-window gemini-code-buffer)
            (delete-window (get-buffer-window gemini-code-buffer))
          (let ((window (funcall gemini-code-display-window-fn gemini-code-buffer)))
            (set-window-parameter window 'no-delete-other-windows gemini-code-no-delete-other-windows)
            (when gemini-code-toggle-auto-select (select-window window))))
      (gemini-code--show-not-running-message))))

;;;###autoload
(defun gemini-code-switch-to-buffer (&optional arg)
  "Switch to the Gemini buffer."
  (interactive "P")
  (if-let ((gemini-code-buffer (gemini-code--get-or-prompt-for-buffer)))
      (pop-to-buffer gemini-code-buffer)
    (gemini-code--show-not-running-message)))

;;;###autoload
(defun gemini-code-select-buffer ()
  "Select and switch to a Gemini buffer from all running instances."
  (interactive)
  (gemini-code-switch-to-buffer t))

;;;###autoload
(defun gemini-code-kill ()
  "Kill Gemini process and close its window."
  (interactive)
  (if-let ((gemini-code-buffer (gemini-code--get-or-prompt-for-buffer)))
      (if gemini-code-confirm-kill
          (when (yes-or-no-p "Kill Gemini instance? ")
            (gemini-code--kill-buffer gemini-code-buffer)
            (message "Gemini instance killed"))
        (gemini-code--kill-buffer gemini-code-buffer)
        (message "Gemini instance killed"))
    (gemini-code--show-not-running-message)))

;;;###autoload
(defun gemini-code-kill-all ()
  "Kill ALL Gemini processes."
  (interactive)
  (let ((all-buffers (gemini-code--find-all-gemini-buffers)))
    (when all-buffers
      (when (or (not gemini-code-confirm-kill) (yes-or-no-p "Kill all instances? "))
        (dolist (buffer all-buffers) (gemini-code--kill-buffer buffer))))))

;;;###autoload
(defun gemini-code-send-command (&optional arg)
  "Read a Gemini command from the minibuffer and send it."
  (interactive "P")
  (let* ((cmd (read-string "Gemini command: " nil 'gemini-code-command-history))
         (selected-buffer (gemini-code--do-send-command cmd)))
    (when (and arg selected-buffer) (pop-to-buffer selected-buffer))))

;;;###autoload
(defun gemini-code-send-command-with-context (&optional arg)
  "Read a Gemini command and send it with current file and line context."
  (interactive "P")
  (let* ((cmd (read-string "Gemini command: " nil 'gemini-code-command-history))
         (file-ref (if (use-region-p)
                       (gemini-code--format-file-reference nil (line-number-at-pos (region-beginning) t) (line-number-at-pos (region-end) t))
                     (gemini-code--format-file-reference)))
         (cmd-with-context (if file-ref (format "%s\n%s" cmd file-ref) cmd)))
    (let ((selected-buffer (gemini-code--do-send-command cmd-with-context)))
      (when (and arg selected-buffer) (pop-to-buffer selected-buffer)))))

;;;###autoload
(defun gemini-code-send-return ()
  "Send <return> to the Gemini Code REPL."
  (interactive)
  (gemini-code--do-send-command ""))

;;;###autoload
(defun gemini-code-send-1 ()
  (interactive) (gemini-code--do-send-command "1"))
(defun gemini-code-send-2 ()
  (interactive) (gemini-code--do-send-command "2"))
(defun gemini-code-send-3 ()
  (interactive) (gemini-code--do-send-command "3"))

;;;###autoload
(defun gemini-code-send-escape ()
  "Send <escape> to the Gemini Code REPL."
  (interactive)
  (gemini-code--with-buffer
   (gemini-code--term-send-string gemini-code-terminal-backend (kbd "ESC"))))

;;;###autoload
(defun gemini-code-send-file (file-path)
  "Send the specified FILE-PATH to Gemini prefixed with `@'."
  (interactive "fFile to send to Gemini: ")
  (gemini-code--do-send-command (format "@%s" (expand-file-name file-path))))

;;;###autoload
(defun gemini-code-send-buffer-file (&optional arg)
  "Send the file associated with current buffer to Gemini."
  (interactive "P")
  (let ((file-path (gemini-code--get-buffer-file-name)))
    (if file-path
        (let* ((prompt (when arg (read-string "Instructions: ")))
               (command (if prompt (format "%s\n\n@%s" prompt file-path) (format "@%s" file-path))))
          (let ((selected-buffer (gemini-code--do-send-command command)))
            (when (and (equal arg '(16)) selected-buffer) (pop-to-buffer selected-buffer))))
      (error "Current buffer is not associated with a file"))))

;;;###autoload
(defun gemini-code-cycle-mode ()
  "Send Shift-Tab to Gemini to cycle between modes."
  (interactive)
  (gemini-code--with-buffer
   (gemini-code--term-send-string gemini-code-terminal-backend "\e[Z")))

;;;###autoload
(defun gemini-code-fork ()
  "Jump to a previous conversation (sends ESC ESC)."
  (interactive)
  (gemini-code--with-buffer
   (gemini-code--term-send-string gemini-code-terminal-backend "")))

;;;###autoload
(defun gemini-code-fix-error-at-point (&optional arg)
  "Ask Gemini to fix the error at point."
  (interactive "P")
  (let ((error-text (if (and (featurep 'flycheck) (bound-and-true-p flycheck-mode))
                        (let ((errors (flycheck-overlay-errors-at (point))))
                          (if errors (mapconcat #'flycheck-error-message errors "\n") "No errors"))
                      (or (help-at-pt-kbd-string) "No errors"))))
    (if (string= error-text "No errors")
        (message "No errors found at point")
      (let ((command (format "Fix error: %s" error-text)))
        (let ((selected-buffer (gemini-code--do-send-command command)))
          (when (and arg selected-buffer) (pop-to-buffer selected-buffer)))))))

;;;###autoload
(defun gemini-code-toggle-read-only-mode ()
  "Toggle between read-only mode and normal mode."
  (interactive)
  (gemini-code--with-buffer
   (if (not (gemini-code--term-in-read-only-p gemini-code-terminal-backend))
       (progn (gemini-code--term-read-only-mode gemini-code-terminal-backend) (message "Gemini read-only enabled"))
     (progn (gemini-code--term-interactive-mode gemini-code-terminal-backend) (message "Gemini read-only disabled")))))

;;;; Mode definition
;;;###autoload
(define-minor-mode gemini-code-mode
  "Minor mode for interacting with Gemini AI CLI."
  :init-value nil
  :lighter " Gemini"
  :global t
  :group 'gemini-code)

(provide 'gemini-code)
;;; gemini-code.el ends here