;;; m3-color-gruvbox.el --- Doom Gruvbox Theme Configuration

(require 'package)
(unless (package-installed-p 'doom-themes)
  (package-refresh-contents)
  (package-install 'doom-themes))

(require 'doom-themes)

;; Disable any previously enabled themes
(mapc #'disable-theme custom-enabled-themes)

;; Load the theme
(load-theme 'doom-gruvbox t)

(doom-themes-visual-bell-config)
(doom-themes-org-config)

(message "m3-color-gruvbox.el: Loaded Doom Gruvbox theme")