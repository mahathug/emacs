(global-set-key (kbd "C-c 1") (lambda () (interactive)(if (get-buffer "fvp-telnet-5000") (switch-to-buffer "fvp-telnet-5000")(fvp-term))))
(global-set-key (kbd "C-c 2") (lambda () (interactive)(if (get-buffer "fvp-telnet-5001") (switch-to-buffer "fvp-telnet-5001")(fvp-term))))
(global-set-key (kbd "C-c 3") (lambda () (interactive)(if (get-buffer "fvp-make") (switch-to-buffer "fvp-make")(fvp-term))))

(load "after-project.el")
