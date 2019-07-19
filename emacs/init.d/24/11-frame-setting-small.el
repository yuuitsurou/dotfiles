;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 初期フレームの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(set-frame-parameter (selected-frame) 'alpha '(83 70))
;(set-face-background 'region "DarkSeaGreen3")
;(set-face-foreground 'region "black")
;;(set-face-foreground 'modeline "white")
;;(set-face-background 'modeline "navy")
;;(setq default-frame-alist
;;      (append (list 
;;			   '(foreground-color . "DarkSeaGreen3")
;;			   '(background-color . "gray12")
;;			   '(border-color . "black")
;;			   '(mouse-color . "white")
;;			   '(cursor-color . "DarkSeaGreen3")
;;			   '(width . 100)
;;			   '(height . 55)
;;			   '(top . 5)
;;			   '(left . 5)
;;			   '(alpha . (95 84 60 60))
;;			   )
;;			  default-frame-alist))
;; (setq default-frame-alist
;;       (append (list 
;; 			   '(foreground-color . "DarkSeaGreen3")
;; 			   '(background-color . "gray12")
;; 			   '(width . 100)
;; 			   '(height . 48)
;; 			   '(top . 5)
;; 			   '(left . 5)
;; 			   '(alpha . (95 84 60 60))
;; 			   )
;; 			  default-frame-alist))
(setq default-frame-alist
      (append (list 
			   '(width . 100)
			   '(height . 45)
			   '(top . 5)
			   '(left . 5)
			   '(alpha . (95 84 60 60))
			   )
			  default-frame-alist))
