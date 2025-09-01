(load "after-project.el")

(global-set-key (kbd "C-c 1") (lambda () (interactive)(if (get-buffer "usb0") (switch-to-buffer "usb0")(serial-usb0))))
(global-set-key (kbd "C-c 2") (lambda () (interactive)(if (get-buffer "usb1") (switch-to-buffer "usb1")(serial-usb1))))
(global-set-key (kbd "C-c 3") (lambda () (interactive)(if (get-buffer "usb2") (switch-to-buffer "usb2")(serial-usb2))))
(global-set-key (kbd "C-c 4") (lambda () (interactive)(if (get-buffer "usb3") (switch-to-buffer "usb3")(serial-usb3))))

