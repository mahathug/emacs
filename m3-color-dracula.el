;;; m3-color-dracula.el --- Doom Palenight Theme Configuration
;; (Renamed from Dracula due to compatibility issues with your Emacs version)

(require 'package)
(unless (package-installed-p 'doom-themes)
  (package-refresh-contents)
  (package-install 'doom-themes))

(require 'doom-themes)

;; Disable any previously enabled themes
(mapc #'disable-theme custom-enabled-themes)

;; Load Doom Palenight
;; A highly popular, soft dark theme based on Material Design.
;; It is extremely similar to Dracula in popularity and vibe but often more stable.
(load-theme 'doom-palenight t)

(doom-themes-visual-bell-config)
(doom-themes-org-config)

(message "m3-color-dracula.el: Loaded Doom Palenight theme (Dracula replacement)")