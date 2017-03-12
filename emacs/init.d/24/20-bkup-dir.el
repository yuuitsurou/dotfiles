;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; $B%P%C%/%"%C%W%U%!%$%k(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/bkup"))
            backup-directory-alist))
(setq version-control     t)  ;; $B<B9T$NM-L5(B
(setq kept-new-versions   2)  ;; $B:G?7$NJ];}?t(B
(setq kept-old-versions   1)  ;; $B:G8E$NJ];}?t(B
(setq delete-old-versions t)  ;; $BHO0O30$r:o=|(B
