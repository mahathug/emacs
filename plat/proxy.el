(setq url-using-proxy t)
(setq url-debug t)
;;(url-retrieve-synchronously (url-generic-parse-url "https://elpa.gnu.org/"))
(setq url-proxy-services
      '(("no_proxy" . "ti.com")
        ("http" . "webproxy.ext.ti.com:80")
        ("https" . "webproxy.ext.ti.com:80")
        ("ftp" . "webproxy.ext.ti.com:80")))
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")  ;; ;;
