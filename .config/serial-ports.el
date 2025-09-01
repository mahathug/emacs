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
