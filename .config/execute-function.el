(defun execute-functions-synchronously (func-args)
  "Execute a list of functions synchronously.
FUNC-ARGS is a list of function names and arguments to be executed.
Example usage:
  M-x execute-functions-synchronously RET projectile-switch-project ~/my-proj"
  (interactive "sEnter function names and arguments (space-separated): ")
  (let ((func-args-list (split-string func-args)))
    (execute-functions-synchronously-internal func-args-list)))

(defun execute-functions-synchronously-internal (func-args-list)
  (let ((i 0)
        (func-args-list func-args-list))
    (while (< i (length func-args-list))
      (let ((func-name (nth i func-args-list))
            (arg (nth (1+ i) func-args-list)))
        (let ((func (symbol-function (intern func-name))))
          (if func
              (progn
                (condition-case nil
                    (if (equal arg "nil")
                        (funcall func)
                      (funcall func arg))
                  (error (message "Error executing %s: %s" func-name (error-message-string))))
                (while compilation-in-progress
                  (sit-for 0.1)))
            (error "Function %s not found" func-name)))
        (setq i (+ i 2))))))
  
(defvar autoboot-sent nil)
;; (defun monitor-buffer-for-autoboot ()
;;   "Monitor a buffer for the string 'autoboot' and send an Enter key when found."
;;   (interactive)
;;   (setq autoboot-sent nil) ; Reset autoboot-sent to nil
;;   (let ((buffer-name (read-string "Enter buffer name: ")))
;;     (if (get-buffer buffer-name)
;;         (run-at-time 1 nil 'monitor-buffer-for-autoboot-loop buffer-name)
;;       (message "Buffer '%s' not found." buffer-name))))

(defun monitor-buffer-for-autoboot ()
  "Monitor a buffer for the string 'autoboot' and send an Enter key when found."
  (interactive)
  (setq autoboot-sent nil) ; Reset autoboot-sent to nil
  (let ((buffer-name "usb0"))
    (if (get-buffer buffer-name)
        (run-at-time 1 nil 'monitor-buffer-for-autoboot-loop buffer-name)
      (message "Buffer '%s' not found." buffer-name))))

(defun monitor-buffer-for-autoboot-loop (buffer-name)
  "Monitor a buffer for the string 'autoboot' and send an Enter key when found.
This function runs in a loop every 1 second."
  (unless autoboot-sent
    (if (get-buffer buffer-name)
        (with-current-buffer (get-buffer buffer-name)
          (save-excursion
            (goto-char (point-max))
            (if (> (point-max) 10)
                (progn
                  (forward-line -10)
                  (if (search-forward "autoboot" (point-max) t)
                      (progn
                        (execute-kbd-macro (kbd "RET"))
                        (setq autoboot-sent t))))
              (if (search-forward "autoboot" (point-max) t)
                  (progn
                    (execute-kbd-macro (kbd "RET"))
                    (setq autoboot-sent t))))))
      (message "Buffer '%s' not found." buffer-name))
    (unless autoboot-sent
      (run-at-time 1 nil 'monitor-buffer-for-autoboot-loop buffer-name))))


