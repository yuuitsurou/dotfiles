;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-ag
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'helm-ag)
(require 'helm-ag)
(setq helm-ag-base-command "rg --no-heading --line-number --color never")
;; 現在のシンボルをデフォルトのクエリにする
(setq helm-ag-insert-at-point 'symbol)

;; process-file を呼び出す前に R/W の coding system を強制的に設定
  ;; (defadvice process-file (before configure-process-coding activate)
  ;;   "Configure process coding for Cyrgin application."
  ;;   (setq coding-system-for-read  'utf-8-dos)     ;; 行末の ^M を避けるため -dos が必要
  ;;   (setq coding-system-for-write 'cp932-dos)
  ;;   )
  ;; :around による advice
  (defun set-rw-coding-system:around (orig-func &rest args)
    (let ((coding-system-for-read  'utf-8-dos) ; 行末の ^M を避けるため -dos が必要
          (coding-system-for-write 'cp932-dos))
      (apply orig-func args)          ; オリジナル関数を呼び出し
      ))
  (advice-add 'process-file :around #'set-rw-coding-system:around)
;;
(global-set-key (kbd "C-M-g") 'helm-ag)
(global-set-key (kbd "C-M-k") 'backward-kill-sexp)

(defun helm-ag-dot-emacs ()
  ".emacs.d以下を検索"
  (interactive)
  (helm-ag "~/.emacs.d/"))
