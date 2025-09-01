(load "after-project.el")

(global-set-key (kbd "C-c 1") (lambda () (interactive)(if (get-buffer "qemu-soc-54320") (switch-to-buffer "qemu-soc-54320")(qemu-term))))
(global-set-key (kbd "C-c 2") (lambda () (interactive)(if (get-buffer "qemu-soc-54321") (switch-to-buffer "qemu-soc-54321")(qemu-term))))
(global-set-key (kbd "C-c 3") (lambda () (interactive)(if (get-buffer "qemu-make-run") (switch-to-buffer "qemu-make-run")(qemu-term))))
(global-set-key (kbd "C-c 4") (lambda () (interactive)(if (get-buffer "qemu-make-run") (switch-to-buffer "qemu-make-run")(qemu-term))))

