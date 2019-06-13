;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-ag
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'helm-ag)
(require 'helm-ag)
(setq helm-ag-base-command "rg --no-heading --line-number --color never")
;; 現在のシンボルをデフォルトのクエリにする
(setq helm-ag-insert-at-point 'symbol)
;;
(global-set-key (kbd "C-M-g") 'helm-ag)
(global-set-key (kbd "C-M-k") 'backward-kill-sexp)

(defun helm-ag-dot-emacs ()
  ".emacs.d以下を検索"
  (interactive)
  (helm-ag "~/.emacs.d/"))
