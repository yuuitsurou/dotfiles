;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smart-mode-line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package smart-mode-line)
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'dark)
;(defvar sml/theme 'respectful)
(setq sml/shorten-directory -1)
(setq sml/read-only-char "%%")
(setq sml/modified-char "*")
(setq sml/hidden-modes '("Helm"))
(setq sml/extra-filler -10)
(sml/setup)
