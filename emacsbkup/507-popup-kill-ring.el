;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; popup-kill-ring
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package popup)
(use-package pos-tip)
(use-package popup-kill-ring
  :config
  (global-set-key "\M-y" 'popup-kill-ring)
  )
