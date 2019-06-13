;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; visual basic mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'visual-basic-mode)
(load-library "visual-basic-mode")
(add-to-list 'auto-mode-alist
	     '("\\.\\(frm\\|bas\\|cls\\|vbs\\|asp\\)$" . visual-basic-mode))
