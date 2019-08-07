;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; recentf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq recentf-max-saved-items 500) ;; 2000ファイルまで履歴保存する
(setq recentf-auto-cleanup 'never)  ;; 存在しないファイルは消さない
(setq recentf-exclude '("/recentf" "COMMIT_EDITMSG" "/.?TAGS" "^/sudo:" ))
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode 1)
