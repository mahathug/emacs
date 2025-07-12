(load "projectile-config.el")
(load "project-specific-config.el")
(load "skeleton-config.el")
(load "execute-function.el")

(setq relay-toggle-cmd (concat "ssh admin@relay-kamlesh -t \"if uom get relay/outlets/"relay-number"/state | grep -q \"true\"; then uom set relay/outlets/"relay-number"/state false  ;else uom set relay/outlets/"relay-number"/state true;fi\""))

(setq relay-off-cmd (concat "ssh admin@relay-kamlesh -t \"if uom get relay/outlets/"relay-number"/state | grep -q \"true\"; then uom set relay/outlets/"relay-number"/state false ;fi\""))

(setq relay-on-cmd (concat "ssh admin@relay-kamlesh -t \"if uom get relay/outlets/"relay-number"/state | grep -q \"false\"; then uom set relay/outlets/"relay-number"/state true ;fi\""))
