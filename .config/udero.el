(setq udero-server "/ssh:ec2-18-222-29-149.us-east-2.compute.amazonaws.com:~/")
(global-set-key (kbd "C-c 1")(lambda() (interactive) (find-file udero-server)))
