;;;; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setting file
;;; init.el
;;; 
;;;   Time-stamp: <2017-02-04 18:50:38 ymine>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 実行環境の判別
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; OSを判別

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar run-unix
  (or (equal system-type 'gnu/linux)
	  (or (equal system-type 'usg-unix-v)
		  (or  (equal system-type 'berkeley-unix)
			   (equal system-type 'cygwin)))))
(defvar run-linux
  (equal system-type 'gnu/linux))
(defvar run-system-v
  (equal system-type 'usg-unix-v))
(defvar run-bsd
  (equal system-type 'berkeley-unix))
(defvar run-cygwin ;; cygwinもunixグループにしておく
  (equal system-type 'cygwin))
(defvar run-w32
  (and (null run-unix)
	   (or (equal system-type 'windows-nt)
		   (equal system-type 'ms-dos))))
(defvar run-darwin (equal system-type 'darwin))
	
;; Emacsenの種類とヴァージョンを判別
(defvar run-emacs23
  (and (equal emacs-major-version 23)
	   (null (featurep 'xemacs))))
(defvar run-emacs24
  (and (equal emacs-major-version 24)
	   (null (featurep 'xemacs))))
(defvar run-emacs25
  (and (equal emacs-major-version 25)
	   (null (featurep 'xemacs))))
(defvar run-meadow (featurep 'meadow))
(defvar run-xemacs (featurep 'xemacs))
(defvar run-xemacs-no-mule
  (and run-xemacs (not (featurep 'mule))))
(defvar run-carbon-emacs (and run-darwin window-system))

(setq my-load-dir "")
(when (and run-w32 run-emacs23)
  (setq my-load-dir "~/.emacs.d/init.d/emacswin"))
(when (and run-w32 run-emacs24)
  (setq my-load-dir "~/.emacs.d/init.d/emacswin24"))
(when (and run-w32 run-emacs25)
  (setq my-load-dir "~/.emacs.d/init.d/24"))
(when (and run-unix run-emacs23)
  (setq my-load-dir "~/.emacs.d/init.d/23"))
(when (and run-unix run-emacs24)
  (setq my-load-dir "~/.emacs.d/init.d/24"))
(when (and run-unix run-emacs25)
  (setq my-load-dir "~/.emacs.d/init.d/24"))
(when (and run-cygwin run-emacs24)
  (setq my-load-dir "/home/ymine/.emacs.d/init.d/cygwin24"))

(let* ((dir my-load-dir)
	   (el-suffix "\\.el\\'")
	   (files (mapcar
			   (lambda (path) (replace-regexp-in-string el-suffix "" path))
			   (directory-files dir t el-suffix))))
  (while files
	(load (car files))
	(setq files (cdr files))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; end of this file.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
