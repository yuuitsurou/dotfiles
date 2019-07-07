;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; moccur edit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package point-undo
  :config
  (require 'point-undo)
  (define-key global-map [f7] 'point-undo)
  (define-key global-map [S-f7] 'point-redo)
  )
