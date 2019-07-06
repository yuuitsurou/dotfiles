;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scheme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq process-coding-system-alist
	  (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "/usr/local/bin/gosh -i")
;(require 'cumscheme)
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run as inferiro Scheme process. " t)

;; (defun gauche-info ()
;;   (interactive)
;;   (switch-to-buffer-other-frame
;;    (get-buffer-create "*info*"))
;;   (info "/usr/local/share/info/gauche-refj.info.gz"))

(defun scheme-other-frame()
  "Run scheme on other frame"
  (interactive)
  (switch-to-buffer-other-frame
   (get-buffer-create "*scheme"))
  (run-scheme scheme-program-name))
;;(defun scheme-other-window()
  ;; "Run scheme on other window"
  ;; (interactive)
  ;; (switch-to-buffer-other-window
  ;;  (get-buffer-create "*scheme"))
  ;; (run-scheme scheme-program-name))
(defun scheme-other-window ()
 "Run Gauche on other window"
 (interactive)
 (split-window-horizontally (/ (frame-width) 2))
 (let ((buf-name (buffer-name (current-buffer))))
	(scheme-mode)
	(switch-to-buffer-other-window
	  (get-buffer-create "*scheme*"))
	(run-scheme scheme-program-name)
	(switch-to-buffer-other-window
	  (get-buffer-create buf-name))))

(define-key global-map
  "\C-xS" 'scheme-other-frame)
(define-key global-map
  "\C-cS" 'scheme-other-window)
