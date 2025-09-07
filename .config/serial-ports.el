(defun serial-usb (device-number)
  "Connect to a USB serial device via picocom.
DEVICE-NUMBER: USB device number (0-7)"
  (interactive "nUSB Device Number (0-7): ")
  (let* ((baud 115200)
	 (suffix (number-to-string device-number))
	 (buffer-name (format "usb%s" suffix))
	 (device-path (format "/dev/ttyUSB%d" device-number)))
    
    (setq kill-buffer-query-functions
	  (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

    (if (get-buffer buffer-name)
        (switch-to-buffer buffer-name)
      (let ((default-directory (or projectile-root default-directory)))
        (shell buffer-name)
        (process-send-string
         (get-buffer-process buffer-name)
         (format "export DEV=%s && sudo picocom -b %d $DEV\n" device-path baud))))))

;; Convenience functions for quick access
(defun serial-usb0 () (interactive) (serial-usb 0))
(defun serial-usb1 () (interactive) (serial-usb 1))
(defun serial-usb2 () (interactive) (serial-usb 2))
(defun serial-usb3 () (interactive) (serial-usb 3))
(defun serial-usb4 () (interactive) (serial-usb 4))
(defun serial-usb5 () (interactive) (serial-usb 5))
(defun serial-usb6 () (interactive) (serial-usb 6))
(defun serial-usb7 () (interactive) (serial-usb 7))

(defun qemu-term ()
  "Create QEMU terminal windows for optee_os project.
Creates three terminals: soc_term.py on ports 54320 and 54321, and make run-only."
  (interactive)
  (if (and projectile-root 
           (string-match-p "optee_os" projectile-root))
    (let ((default-directory projectile-root))
      (setq kill-buffer-query-functions
            (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
      
      ;; Terminal 1: soc_term.py 54320
      (let ((buffer-name-1 "qemu-soc-54320"))
        (if (get-buffer buffer-name-1)
            (switch-to-buffer buffer-name-1)
          (message "Creating QEMU terminal buffer: %s" buffer-name-1)
          (shell buffer-name-1)
          (sit-for 0.5)  ; Wait for shell to be ready
          (when (get-buffer-process buffer-name-1)
            (process-send-string
             (get-buffer-process buffer-name-1)
             "./build/soc_term.py 54320\n"))))
      
      ;; Terminal 2: soc_term.py 54321
      (let ((buffer-name-2 "qemu-soc-54321"))
        (if (get-buffer buffer-name-2)
            (switch-to-buffer buffer-name-2)
          (message "Creating QEMU terminal buffer: %s" buffer-name-2)
          (shell buffer-name-2)
          (sit-for 0.5)  ; Wait for shell to be ready
          (when (get-buffer-process buffer-name-2)
            (process-send-string
             (get-buffer-process buffer-name-2)
             "./build/soc_term.py 54321\n"))))
      
      ;; Terminal 3: make run-only
      (let ((buffer-name-3 "qemu-make-run"))
        (if (get-buffer buffer-name-3)
            (switch-to-buffer buffer-name-3)
          (message "Creating QEMU terminal buffer: %s" buffer-name-3)
          (shell buffer-name-3)
          (sit-for 0.5)  ; Wait for shell to be ready
          (when (get-buffer-process buffer-name-3)
            (process-send-string
             (get-buffer-process buffer-name-3)
             "cd build && make run-only\n")))))
    (message "qemu-term: Not in an optee_os project (current project: %s)" 
             (or projectile-root "none"))))

(defun fvp-term ()
  "Create FVP terminal windows for optee_os project.
Creates five terminals: telnet localhost on ports 5000, 5001, 5002, 5003, and 5004."
  (interactive)
  (if (and projectile-root 
           (string-match-p "optee_os" projectile-root))
    (let ((default-directory projectile-root))
      (setq kill-buffer-query-functions
            (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
      
      ;; Terminal 1: telnet localhost 5000
      (let ((buffer-name-1 "fvp-telnet-5000"))
        (if (get-buffer buffer-name-1)
            (switch-to-buffer buffer-name-1)
          (message "Creating FVP terminal buffer: %s" buffer-name-1)
          (shell buffer-name-1)
          (sit-for 0.5)  ; Wait for shell to be ready
          (when (get-buffer-process buffer-name-1)
            (process-send-string
             (get-buffer-process buffer-name-1)
             "telnet localhost 5000\n"))))
      
      ;; Terminal 2: telnet localhost 5001
      (let ((buffer-name-2 "fvp-telnet-5001"))
        (if (get-buffer buffer-name-2)
            (switch-to-buffer buffer-name-2)
          (message "Creating FVP terminal buffer: %s" buffer-name-2)
          (shell buffer-name-2)
          (sit-for 0.5)  ; Wait for shell to be ready
          (when (get-buffer-process buffer-name-2)
            (process-send-string
             (get-buffer-process buffer-name-2)
             "telnet localhost 5001\n"))))
      
      ;; Terminal 3: telnet localhost 5002
      (let ((buffer-name-3 "fvp-telnet-5002"))
        (if (get-buffer buffer-name-3)
            (switch-to-buffer buffer-name-3)
          (message "Creating FVP terminal buffer: %s" buffer-name-3)
          (shell buffer-name-3)
          (sit-for 0.5)  ; Wait for shell to be ready
          (when (get-buffer-process buffer-name-3)
            (process-send-string
             (get-buffer-process buffer-name-3)
             "telnet localhost 5002\n"))))
      
      ;; Terminal 4: telnet localhost 5003
      (let ((buffer-name-4 "fvp-telnet-5003"))
        (if (get-buffer buffer-name-4)
            (switch-to-buffer buffer-name-4)
          (message "Creating FVP terminal buffer: %s" buffer-name-4)
          (shell buffer-name-4)
          (sit-for 0.5)  ; Wait for shell to be ready
          (when (get-buffer-process buffer-name-4)
            (process-send-string
             (get-buffer-process buffer-name-4)
             "telnet localhost 5003\n"))))
      
      ;; Terminal 5: telnet localhost 5004
      (let ((buffer-name-5 "fvp-telnet-5004"))
        (if (get-buffer buffer-name-5)
            (switch-to-buffer buffer-name-5)
          (message "Creating FVP terminal buffer: %s" buffer-name-5)
          (shell buffer-name-5)
          (sit-for 0.5)  ; Wait for shell to be ready
          (when (get-buffer-process buffer-name-5)
            (process-send-string
             (get-buffer-process buffer-name-5)
             "telnet localhost 5004\n")))))
    (message "fvp-term: Not in an optee_os project (current project: %s)" 
             (or projectile-root "none"))))
