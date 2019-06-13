;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smart-mode-line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'smart-mode-line)
(defvar sml/no-confirm-load-theme t)
(defvar sml/theme 'dark)
;(defvar sml/theme 'respectful)
(defvar sml/shorten-directory -1)
(defvar sml/read-only-char "%%")
(defvar sml/modified-char "*")
(defvar sml/hidden-modes '("Helm"))
(defvar sml/extra-filler -10)
(sml/setup)
