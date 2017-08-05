(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
(eval-after-load "rust-mode"
  '(setq-default rust-format-on-save t))

(add-hook 'rust-mode-hook (lambda ()
			   (racer-mode)
			   (flycheck-rust-setup)))
