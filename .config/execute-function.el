(defun execute-functions-synchronously (func-args)
  "Execute a list of functions synchronously.
FUNC-ARGS is a list of function names and arguments to be executed.
Example usage:
  M-x execute-functions-synchronously RET"
  (interactive
   (list
    (completing-read "Enter function names and arguments (space-separated): "
                     (all-completions "" obarray 'functionp))))
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
		(message "exec %s" func-name)
                (condition-case nil
		    (cond
                     ((equal arg "n")
		      (message "interactive")
                      (call-interactively func))
                     ((equal arg "nil")
		      (message "funcall")
                      (funcall func))
                     (t
		      (message "arg funcall")
                      (funcall func arg)))
                  (error (message "Error executing %s: %s" func-name (error-message-string))))
		(while compilation-in-progress
                  (sit-for 0.1)))
            (error "Function %s not found" func-name)))
        (setq i (+ i 2))))))

(defun switch-project (buffer-name)
  "Update the projectile project root to the path of the given buffer."
  (let ((buffer (get-buffer buffer-name)))
    (if buffer
        (with-current-buffer buffer
          (setq projectile-project-root default-directory)
	  (setq projectile-root (file-truename default-directory))
	  (switch-to-buffer buffer-name)
          (message "Projectile project root updated to %s" projectile-project-root))
      (message "Buffer %s not found" buffer-name))))

(defun projectile-shell ()
  (interactive)
  (let ((default-directory projectile-root))	  
    (projectile-run-shell)))

(defun send-to-uboot (string)
  "Send a string to the buffer 'usb0'."
  (interactive "sEnter string to send: ")
  (let ((buffer (get-buffer "usb0")))
    (if buffer
        (with-current-buffer buffer
          (process-send-string (get-process (buffer-name)) string))
      (message "Buffer 'usb0' not found"))))

(defvar autoboot-sent nil)

(defun monitor-buffer-for-autoboot ()
  "Monitor a buffer for the string 'autoboot' and send a string when found."
  (interactive)
  (setq autoboot-sent nil) ; Reset autoboot-sent to nil
  (let ((buffer-name "usb0")
        (send-string "\rums 0 mmc 1\r\n"))
    (if (get-buffer buffer-name)
        (run-at-time 1 nil 'monitor-buffer-for-autoboot-loop buffer-name send-string)
      (message "Buffer '%s' not found." buffer-name))))

(defun monitor-buffer-for-autoboot-loop (buffer-name send-string)
  "Monitor a buffer for the string 'autoboot' and send a string when found.
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
                        (process-send-string (get-process buffer-name) send-string)
                        (setq autoboot-sent t))))
              (if (search-forward "autoboot" (point-max) t)
                  (progn
                    (process-send-string (get-process buffer-name) send-string)
                    (setq autoboot-sent t))))))
      (message "Buffer '%s' not found." buffer-name))
    (unless autoboot-sent
      (run-at-time 1 nil 'monitor-buffer-for-autoboot-loop buffer-name send-string))))


(define-skeleton sk-ex-cmd-uboot
  "In-buffer settings info for a emacs-org file."
  "Title: "
  (process-send-string (get-buffer-process (current-buffer)) "\r"))

(define-skeleton sk-ex-cp-Image
  "In-buffer settings info for a emacs-org file."
  "Title: "
  "relay-reset nil sleep-for-n 2 switch-project ti-u-boot-cgit dfu-boot nil serial-usb0 nil monitor-buffer-for-autoboot nil switch-project ti-linux-kernel-cgit sleep-for-n 5 m-root nil cp-image nil um-root nil serial-usb0 nil comint-interrupt-subjob nil send-to-uboot boot sk-ex-cmd-uboot nil"
  )

(define-skeleton sk-ex-tfab-ubootb
  "In-buffer settings info for a emacs-org file."
  "Title: "
  "switch-project trusted-firmware-a relay-reset nil sleep-for-n 2 switch-project ti-u-boot-cgit dfu-boot nil serial-usb0 nil monitor-buffer-for-autoboot nil switch-project ti-linux-kernel-cgit sleep-for-n 5 m-root nil cp-image nil um-root nil serial-usb0 nil comint-interrupt-subjob nil send-to-uboot boot sk-ex-cmd-uboot nil"
  )

(define-skeleton sk-ex-clean-save
  "In-buffer settings info for a emacs-org file."
  "Title: "
  "untabify n tabify n whitespace-cleanup n single-lines n"
  )
