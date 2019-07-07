;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; goto-chg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package goto-chg
  :config
  (require 'goto-chg)
  (global-set-key (kbd "<f8>") 'goto-last-change)
  (global-set-key (kbd "<M-f8>") 'goto-last-change-reverse)
  )
