(use-package claude-code-ide
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :bind ("<f5>" . claude-code-ide-menu) ; Set your favorite keybinding
  :config
  (claude-code-ide-emacs-tools-setup)) ; Optionally enable Emacs MCP tools

;; Use regular window instead of side window
(setq claude-code-ide-use-side-window nil)

;; Or switch back to vterm (default)
(setq claude-code-ide-terminal-backend 'vterm)

;; Enable/disable vterm anti-flicker optimization (enabled by default)
(setq claude-code-ide-vterm-anti-flicker t)

;; Adjust the render delay for batching updates (default is 0.005 seconds)
(setq claude-code-ide-vterm-render-delay 0.01)  ; Increase for smoother but less responsive

;; Adjust the terminal initialization delay (default is 0.1 seconds)
(setq claude-code-ide-terminal-initialization-delay 0.15)
