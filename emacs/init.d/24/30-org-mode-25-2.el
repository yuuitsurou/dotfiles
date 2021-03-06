;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'org-install)
;;(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(setq org-startup-truncated nil)
;(add-to-list 'org-export-backends 'md)
;(setq org-hide-leading-stars t)
(setq org-directory "~/org")
(setq org-agenda-files (list org-directory))
(setq org-default-notes-file "notes.org")

;; TODO
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "SOMEDAY(s)" "DOING(g)" "|" "DONE(d)" "CANCELED(c@)")))

;; DONEの時刻
(setq org-log-done 'time)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
             "* TODO %?\n %i\n %a\n %t")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
             "* %?\n %U\n %i\n %a")
        ("n" "Note" entry (file+headline "~/org/notes.org" "Notes")
             "* %?\n %U\n %i\n %a")
	))

(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/org/" file))))
(global-set-key (kbd "C-M-^") '(lambda () (interactive)
                                 (show-org-buffer "notes.org")))

(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

(setq org-startup-indented t)
(setq org-indent-mode-turns-on-hiding-stars nil)
(setq org-indent-indentation-per-level 4)
