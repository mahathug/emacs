;;ediff
;; turn off whitespace checking:
(setq ediff-diff-options "-w")
;; side by side diff
(setq ediff-split-window-function 'split-window-horizontally)
;; ne pas ouvrir de fenêtre séparée pour les contrôles :
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; refinement:
(setq-default ediff-forward-word-function 'forward-char)
(setq-default ediff-ignore-similar-regions t)
(setq-default ediff-highlight-all-diffs nil)
(defvar mkm/dired-file-1)

(defun mkm/ediff-push ()
  (interactive)
  (setq mkm/dired-file-1 (dired-get-filename)))
(defun mkm/ediff-pop ()
  (interactive)
  (ediff-files mkm/dired-file-1 (dired-get-filename)))
(add-hook 'dired-mode-hook
	  (lambda()
            (define-key dired-mode-map (kbd "C-c u") 'mkm/ediff-push)
            (define-key dired-mode-map (kbd "C-c o") 'mkm/ediff-pop)))
(defvar ediff-do-hexl-diff nil
  "variable used to store trigger for doing diff in hexl-mode")
(defadvice ediff-files-internal (around ediff-files-internal-for-binary-files activate)
  "catch the condition when the binary files differ

the reason for catching the error out here (when re-thrown from the inner advice)
is to let the stack continue to unwind before we start the new diff
otherwise some code in the middle of the stack expects some output that
isn't there and triggers an error"
  (let ((file-A (ad-get-arg 0))
        (file-B (ad-get-arg 1))
        ediff-do-hexl-diff)
    (condition-case err
        (progn
          ad-do-it)
      (error
       (if ediff-do-hexl-diff 
           (let ((buf-A (find-file-noselect file-A))
                 (buf-B (find-file-noselect file-B)))
             (with-current-buffer buf-A
	       (hexl-mode 1))
             (with-current-buffer buf-B
	       (hexl-mode 1))
             (ediff-buffers buf-A buf-B))
         (error (error-message-string err)))))))

(defadvice ediff-setup-diff-regions (around ediff-setup-diff-regions-for-binary-files activate)
  "when binary files differ, set the variable "
  (condition-case err
      (progn
        ad-do-it)
    (error
     (setq ediff-do-hexl-diff
           (and (string-match-p "^Errors in diff output.  Diff output is in.*"
                                (error-message-string err))
                (string-match-p "^\\(Binary \\)?[fF]iles .* and .* differ"
                                (buffer-substring-no-properties
                                 (line-beginning-position)
                                 (line-end-position)))
                (y-or-n-p "The binary files differ, look at the differences in hexl-mode? ")))
     (error (error-message-string err)))))
