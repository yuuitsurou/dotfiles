;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; grepの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq grep-program "rg --no-heading --color never")
(setq grep-find-command '("/bin/find . -type f -exec rg -nH --no-heading --color never '' {} NULL \\;" . 42))
