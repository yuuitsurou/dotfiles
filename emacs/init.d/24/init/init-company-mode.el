;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-company-mode +1)
(custom-set-variables
 '(company-idle-delay nil)
 '(company-selection-wrap-around t))
(global-set-key (kbd "M-\\") 'company-complete)
(define-key emacs-lisp-mode-map (kbd "M-\\") 'company-complete)
(company-quickhelp-mode +1)
