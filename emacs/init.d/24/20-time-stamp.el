;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 最終更新日の自動挿入
;;;   ファイルの先頭から 8 行以内に Time-stamp: <2015-01-21 11:44:57 ymine> または
;;;   Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入されます
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (not (memq 'time-stamp write-file-hooks))
    (setq write-file-hooks
          (cons 'time-stamp write-file-hooks)))

(defun my-insert-current-date()
  (interactive)
  (insert (format-time-string "%Y/%m/%d" (current-time))))

(define-key global-map "\C-cd" 'my-insert-current-date)

(defun my-insert-current-datetime()
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))

(define-key global-map "\C-ct" 'my-insert-current-datetime)

(defun my-insert-file-name ()
  (interactive)
  (insert (file-name-nondirectory buffer-file-name)))

(define-key global-map "\C-cf" 'my-insert-file-name)
