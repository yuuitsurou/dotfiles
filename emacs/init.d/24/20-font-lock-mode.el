;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B%+%i!<I=<((B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-font-lock-mode t)
;; $B%9%Z!<%9(B
(defface my-face-b-1
  '((t (:background "gray20" :bold t)))
  nil :group 'font-lock-highlighting-faces)
;; (defface my-face-b-1
;;   '((t (:background "gray24" :bold t :underline "blue")))
;;   nil :group 'font-lock-highlighting-faces)
;; $B%?%V$@$1$N9T(B
(defface my-face-b-2
  '((t (:background "orange" :bold t :underline "orange")))
  nil :group 'font-lock-highlighting-faces)
;; $BH>3Q%9%Z!<%9(B
(defface my-face-b-3 '((t (:background "gray20")))
  nil :group 'font-lock-highlighting-faces)

(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-b-3 'my-face-b-3)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   ;; "[\t]+$" $B9TKv$N%?%V(B
   '(("$B!!(B" 0 my-face-b-1 append)
     ("[ ]+$" 0 my-face-b-3 append)
     ("[\t]+$" 0 my-face-b-2 append))))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
