;;; m3-color-solarized.el --- Doom Solarized Dark Theme Configuration

(require 'package)
(unless (package-installed-p 'doom-themes)
  (package-refresh-contents)
  (package-install 'doom-themes))

(require 'doom-themes)

;; Disable any previously enabled themes
(mapc #'disable-theme custom-enabled-themes)

;; Load Doom Solarized Dark
(load-theme 'doom-solarized-dark t)

(doom-themes-visual-bell-config)
(doom-themes-org-config)

(message "m3-color-solarized.el: Loaded Doom Solarized Dark theme")