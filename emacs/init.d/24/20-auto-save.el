;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 自動保存機能
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq auto-save-default nil)
(setq auto-save-list-file-prefix (expand-file-name "~/.emacs.d/autosave/"))
(setq delete-auto-save-files t)
(setq create-lockfiles nil)
