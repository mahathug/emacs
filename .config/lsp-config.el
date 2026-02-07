(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((python-mode . lsp)
         (rust-mode . lsp)
         (go-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (json-mode . lsp)
         (yaml-mode . lsp))
  :config
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-enable-symbol-highlighting t
        lsp-modeline-code-actions-enable t
        lsp-idle-delay 0.2))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
