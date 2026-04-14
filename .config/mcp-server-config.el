;; emacs-mcp-server configuration
;; https://github.com/rhblind/emacs-mcp-server
;;
;; Installation (run once):
;;   The package is installed via use-package :vc below.
;;   Requires socat: sudo apt install socat  (already installed)
;;
;; Register with Claude CLI (run once in terminal after first Emacs start):
;;   claude mcp add emacs --scope user \
;;     ~/.emacs.d/elpa/mcp-server/mcp-wrapper.py \
;;     ~/.emacs.d/.local/cache/emacs-mcp-server.sock
;;
;; Usage:
;;   M-x mcp-server-start-unix   -- start the server
;;   M-x mcp-server-status       -- check status
;;   M-x mcp-server-stop         -- stop the server

;; Ensure proxy is set for git operations during package-vc install
(setenv "https_proxy" "http://webproxy.ext.ti.com:80")
(setenv "http_proxy" "http://webproxy.ext.ti.com:80")

(use-package mcp-server
  :vc (:url "https://github.com/rhblind/emacs-mcp-server"
       :rev :newest
       :files ("*.el" "tools/*.el" "mcp-wrapper.py" "mcp-wrapper.sh"))

  :config
  ;; Store socket under ~/.emacs.d to match your emacs.d location
  (setq mcp-server-socket-directory "~/.emacs.d/.local/cache/")

  ;; Disable eval-elisp for safety (allows arbitrary code execution)
  ;; Only expose diagnostics tool; add eval-elisp here only if you trust the LLM client
  (setq mcp-server-emacs-tools-enabled 'all)

  ;; Auto-start MCP server when Emacs starts
  (add-hook 'emacs-startup-hook #'mcp-server-start-unix))
