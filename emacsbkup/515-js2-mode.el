;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; js2-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package js2-mode
  :ensure t
  :config
  ;;(require 'js2-mode)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  )
