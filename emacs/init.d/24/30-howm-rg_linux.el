;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; howm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/howm/")
;;(setq howm-directory "~/iris/ymine/howm/")
(setq howm-directory "~/howm/")
(setq howm-history-file "~/howm/.howm-history")
(setq howm-keyword-file "~/howm/.howm-keys")
(setq howm-menu-file "~/howm/menu.txt")
(setq howm-menu-lang 'ja)
(setq howm-keyword-case-fold-search t)
(global-set-key "\C-c,," 'howm-menu)
(autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)
(setq howm-content-from-region t)
;; 「最近のメモ」一覧時にタイトル表示
(setq howm-list-recent-title t)
;; 最近のメモの表示件数
(setq howm-menu-recent-num 30)
(setq howm-list-recent 21)
;; 全メモ一覧時にタイトル表示
(setq howm-list-all-title t)
;; メモの削除
;;(if (not (memq 'delete-file-if-no-contents after-save-hook))
;;	(setq after-save-hook
;;		  (cons 'delete-file-if-no-contents after-save-hook)))
;;(defun delete-file-if-no-contents ()
;;  (when (and
;;		 (buffer-file-name (current-buffer))
;;		 (= (point-min) (point-max)))
;;	(when (y-or-n-p "Delete file and kill buffer?")
;;	  (delete-file
;;	   (buffer-file-name (current-buffer)))
;;	  (kill-buffer (current-buffer)))))
;; メニューを自動更新しない 
(setq howm-menu-refresh-after-save nil)
;; 下線を引き直さない 
(setq howm-refresh-after-save nil)
;; (defadvice howm-after-save
;;   (around not-refresh-other-file activate)
;;   (let* ((howm-menu-refresh-after-save
;; 		  (if (and
;; 			   (buffer-file-name)
;; 			   (string-match "\\.howm" (buffer-file-name)))
;; 			  t
;; 			nil))
;; 		 (howm-refresh-after-save howm-menu-refresh-after-save))
;; 	ad-do-it))
;(setq howm-process-coding-system 'utf-8-unix)
;(setq howm-process-coding-system '(utf-8-dos . cp932-unix))
(setq howm-view-use-grep t)
(setq howm-view-grep-command "rg")
(setq howm-view-grep-option "-nH --no-heading --color never")
(setq howm-view-grep-extended-option nil)
(setq howm-view-grep-fixed-option "-F")
(setq howm-view-grep-expr-option nil)
(setq howm-view-grep-file-stdin-option nil)
;; howm-menu で -j1 オプションを使う
(defun howm-menu-with-j1 (orig-fun &rest args)
  (setq howm-view-grep-option "-nH --no-heading -j1 --color never")
  (apply orig-fun args)
  (setq howm-view-grep-option "-nH --no-heading --color never"))

(advice-add 'howm-menu-refresh :around #'howm-menu-with-j1)
