;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; goto-chg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'goto-chg)
(require 'goto-chg)
(global-set-key (kbd "<f8>") 'goto-last-change)
(global-set-key (kbd "<M-f8>") 'goto-last-change-reverse)
