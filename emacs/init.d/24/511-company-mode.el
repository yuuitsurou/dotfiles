;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'company)
(straight-use-package 'company-quickhelp)
(require 'company)
(global-company-mode +1)
(custom-set-variables
 '(company-idle-delay nil)
 '(company-selection-wrap-around t))
(global-set-key (kbd "M-\\") 'company-complete)
;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)

;; C-sで絞り込む
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)

(define-key emacs-lisp-mode-map (kbd "M-\\") 'company-complete)
(company-quickhelp-mode +1)
(setq company-dabbrev-downcase nil)
