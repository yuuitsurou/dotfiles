;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; カラー表示
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-font-lock-mode t)
;; スペース
(defface my-face-b-1
  '((t (:background "gray20" :bold t)))
  nil :group 'font-lock-highlighting-faces)
;; (defface my-face-b-1
;;   '((t (:background "gray24" :bold t :underline "blue")))
;;   nil :group 'font-lock-highlighting-faces)
;; タブだけの行
(defface my-face-b-2
  '((t (:background "orange" :bold t :underline "orange")))
  nil :group 'font-lock-highlighting-faces)
;; 半角スペース
(defface my-face-b-3 '((t (:background "gray20")))
  nil :group 'font-lock-highlighting-faces)

(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-b-3 'my-face-b-3)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   ;; "[\t]+$" 行末のタブ
   '(("　" 0 my-face-b-1 append)
     ("[ ]+$" 0 my-face-b-3 append)
     ("[\t]+$" 0 my-face-b-2 append))))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
