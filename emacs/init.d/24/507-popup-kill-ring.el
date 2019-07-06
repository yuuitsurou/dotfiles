;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; popup-kill-ring
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package popup)
(use-package pos-tip)
(use-package popup-kill-ring)
;(require 'popup)
;(require 'pos-tip)
;(require 'popup-kill-ring)
(global-set-key "\M-y" 'popup-kill-ring)
