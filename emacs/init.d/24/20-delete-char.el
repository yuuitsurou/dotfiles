;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; delete $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key [delete] 'delete-char)
(global-set-key "\C-ch" 'help-command)
