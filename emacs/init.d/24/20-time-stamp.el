;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; $B:G=*99?7F|$N<+F0A^F~(B
;;;   $B%U%!%$%k$N@hF,$+$i(B 8 $B9T0JFb$K(B Time-stamp: <2015-01-21 11:44:57 ymine> $B$^$?$O(B
;;;   Time-stamp: " " $B$H=q$$$F$"$l$P!"%;!<%V;~$K<+F0E*$KF|IU$,A^F~$5$l$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (not (memq 'time-stamp write-file-hooks))
    (setq write-file-hooks
          (cons 'time-stamp write-file-hooks)))

(defun my-insert-current-date()
  (interactive)
  (insert (format-time-string "%Y/%m/%d" (current-time))))

(define-key global-map "\C-cd" 'my-insert-current-date)

(defun my-insert-current-datetime()
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))

(define-key global-map "\C-ct" 'my-insert-current-datetime)

(defun my-insert-file-name ()
  (interactive)
  (insert (file-name-nondirectory buffer-file-name)))

(define-key global-map "\C-cf" 'my-insert-file-name)
