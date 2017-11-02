;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; go-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setenv "GOPATH" "/home/ymine/go")
(add-to-list 'exec-path (expand-file-name "/home/ymine/go/bin"))
(require 'go-mode-autoloads)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda()
		  (set (make-local-variable 'company-backends) '(company-go))
		  (company-mode)
		  ))
