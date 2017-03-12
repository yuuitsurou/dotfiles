;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; save place
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (equal emacs-major-version 24)
  (load "saveplace")
  (setq-default save-place t))
(when (equal emacs-major-version 25) 
  (save-place-mode 1))
