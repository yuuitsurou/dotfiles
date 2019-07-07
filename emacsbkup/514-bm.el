;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package bm
  :config
  (setq-default bm-buffer-persistence nil)
  (setq bm-restore-repository-on-load t)
  (require 'bm)
  (add-hook 'find-file-hook 'bm-buffer-restore)
  (add-hook 'kill-buffer-hook 'bm-buffer-save)
  (add-hook 'after-save-hook 'bm-buffer-save)
  (add-hook 'after-revert-hook 'bm-buffer-restore)
  (add-hook 'vc-before-checkin-hook 'bm-buffer-save)
  (add-hook 'kill-emacs-hook '(lambda nil
				(bm-buffer-save-all)
				(bm-repository-save)))
  (global-set-key (kbd "M-SPC") 'bm-toggle)
  (global-set-key (kbd "M-[") 'bm-previous)
  (global-set-key (kbd "M-]") 'bm-next)
)
