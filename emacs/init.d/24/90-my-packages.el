(straight-use-package 'ddskk)
(setq skk-server-host "localhost"
	  skk-server-portnum 1178
	  skk-server-report-response nil)
(setq skk-large-jisyo nil)
(when (require 'skk nil t)
  (global-set-key "\C-\\" 'skk-mode))
;; 変換開始のキーを ; に
(setq skk-sticky-key ";")
;; Enter キーを押したときに確定
(setq skk-egg-like-newline t)
;;
(setq skk-japanese-message-and-error t) ; エラーを日本語に
(setq skk-show-japanese-menu t)		; メニューを日本語に
;; ;; 確定のアンドゥ
(define-key skk-j-mode-map (kbd "C-M-j") 'skk-undo-kakutei)
;; ;; 変換候補を2列
;(setq skk-henkan-show-candidates-rows 2)

;; ;; アノテーション
(setq skk-show-annotation t)
;; ;; モードラインにSKKアイコンを表示
(setq skk-show-icon t)
(require 'skk-study)
;; ;; 閉じカッコを自動的に挿入
(setq skk-auto-insert-paren t)
;; ;(setq skk-dcomp-activate t)
;; ;(setq skk-dcomp-multiple-activate t) ; 動的補完の複数候補表示
;; ;(setq skk-dcomp-multiple-rows 10)    ; 動的補完の候補表示件数
(setq skk-iserach-start-mode 'latin)
;; ;; 半角カナ入力
(setq skk-use-jisx0201-input-method t)
(setq skk-share-private-jisyo t)
;; ;; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
;; ;; 辞書登録のとき、余計な送り仮名を送らない
(setq skk-check-okurigana-on-toroku 'auto)
(setq skk-use-look t)
 (when skk-use-look
   (setq skk-look-recursive-search t)
   (setq skk-look-use-ispell nil)
   (add-hook 'skk-search-excluding-word-pattern-function
 	    ;; KAKUTEI-WORD を引数にしてコールされるので、不要でも引数を取る
 	    ;; 必要あり
 	    #'(lambda (kakutei-word)
 		(and skk-abbrev-mode
 		     (save-match-data
 		       ;; `skk-henkan-key' が "*" で終わるとき、または
 		       ;; `skk-henkan-key' が数字のみのとき
 		       (or (string-match "\\*$" skk-henkan-key)
 			   (string-match "^[0-9]*$" skk-henkan-key)))))))

(require 'skk-hint)
(setq skk-hint-start-char 58)
;; (setq skk-show-inline t)
;; (setq skk-show-tooltip t)
(setq skk-show-candidates-always-pop-to-buffer t)
;; ;; 10 分放置すると個人辞書が自動的に保存される設定
(defvar skk-auto-save-jisyo-interval 600)
(defun skk-auto-save-jisyo ()
   (skk-save-jisyo)
   ;; skk-bayesian.el を使っていなければ以下の 2 行はコメントアウト
   ;; (skk-bayesian-save-history)
   ;; (skk-bayesian-corpus-save)
   )
(run-with-idle-timer skk-auto-save-jisyo-interval
 		     skk-auto-save-jisyo-interval
 		     'skk-auto-save-jisyo)
(cancel-function-timers 'skk-auto-save-jisyo)

;; ;; 単語登録／単語削除のたびに個人辞書を保存する
(setq skk-save-jisyo-instantly t)
;(define-key minibuffer-local-map (kbd "C-j") 'skk-kakutei)
;; ■モードのまま C-j を有効とする
;(defun skk-C-j-key (arg)
;  (interactive "P")
;  (let ((enable-modes '(lisp-interaction-mode ; eval-print-last-sexp
;			emacs-lisp-mode	      ; newline-and-indent
;			;; and more.
;			)))
;    (cond
;     ((and (null (skk-in-minibuffer-p))
;	   (null skk-henkan-mode)
;	   (member major-mode enable-modes))
;      (skk-emulate-original-map arg))
;     (t
;      (skk-kakutei arg)))))

;(add-to-list 'skk-rom-kana-rule-list
;	     '(skk-kakutei-key nil skk-C-j-key))
;; (use-package mozc
;;   :config
;;   (setq default-input-method "japanese-mozc")
;; ;  (setq mozc-candidate-style 'overlay)
;; ;  (setq mozc-candidate-style 'echo-area)
;;     (progn ;toggle input method
;;       (define-key global-map [henkan]
;; 	(lambda ()
;; 	  (interactive)
;; 	  (if current-input-method (inactivate-input-method))
;; 	  (toggle-input-method)))
;;       (define-key global-map [muhenkan]
;;         (lambda ()
;;           (interactive)
;;           (inactivate-input-method)
;; 	  )
;; 	)
;;       (define-key global-map [zenkaku-hankaku]
;; 	(lambda ()
;; 	  (interactive)
;; 	  (toggle-input-method)))

;;       (defadvice mozc-handle-event (around intercept-keys (event))
;; 	"Intercept keys muhenkan and zenkaku-hankaku, before passing keys to mozc-server (which the function mozc-handle-event does), to properly disable mozc-mode."
;; 	(if (member event (list 'zenkaku-hankaku 'muhenkan))
;; 	    (progn
;; 	      (mozc-clean-up-session)
;; 	      (toggle-input-method))
;; 	  (progn ;(message "%s" event) ;debug
;; 	    ad-do-it)))
;;       (ad-activate 'mozc-handle-event))
;;     ;; (global-set-key (kbd "<henkan>") '(lambda ()
;;     ;; 				      (interactive)
;;     ;; 				      (mozc-mode 1)
;;     ;; 				      (set-cursor-color "dark orange")
;;     ;; 				      ))
;;     ;; (global-set-key (kbd "<muhenkan>") '(lambda ()
;;     ;; 					(interactive)
;;     ;; 					(mozc-mode 0)
;;     ;; 					(set-cursor-color "grey")
;;     ;; 					))
;;   )
;; (use-package mozc-popup
;;   :config
;;   (setq mozc-candidate-style 'popup)
;;   )
  
;; (use-package ibus
;;   :config
;;   (add-hook 'after-init-hook 'ibus-mode-on)

;;   ;; C-SPC は Set Mark に使う
;;   (ibus-define-common-key ?\C-s nil)
;;   ;; C-/ は Undo に使う
;;   (ibus-define-common-key ?\C-/ nil)
;;   ;; IBusの状態によってカーソル色を変化させる ("on" "off" "disabled")
;;   (setq ibus-cursor-color '("firebrick" "dark orange" "royal blue"))
;;   ;; すべてのバッファで入力状態を共有 (default ではバッファ毎にインプットメソッドの状態を保持)
;;   (setq ibus-mode-local nil)
;;   ;; カーソル位置で予測候補ウィンドウを表示 (default はプリエディット領域の先頭位置に表示)
;;   (setq ibus-prediction-window-position t)
;;   ;; isearch 時はオフに
;;   (ibus-disable-isearch)
;;   ;; mini buffer ではオフに
;;   (add-hook 'minibuffer-setup-hook 'ibus-disable)
;;   ;; Keybindings
;;   ;;(global-set-key (kbd "henkan") 'ibus-toggle)
;;   (global-set-key (kbd "<henkan>") (lambda () (interactive) (ibus-enable)))
;;   (global-set-key (kbd "<muhenkan>") (lambda () (interactive) (ibus-disable)))
;;   (global-set-key (kbd "C-<f7>")
;;                   (lambda ()
;;                     (interactive)
;;                     (shell-command-to-string
;;                      "/usr/lib/mozc/mozc_tool --mode=word_register_dialog")))
;;   )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elscreen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package elscreen
  :no-require t
  :config
  (elscreen-start)
  (elscreen-set-prefix-key "\C-t")
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; migemo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package migemo
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--nonewline" "--emacs"))
  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-use-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)
  (setq migemo-pattern-alist-length 1000)
  (setq migemo-coding-system 'utf-8-unix)
  ;;(load-library "migemo")
  (migemo-init)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ivy / counsel / swiper
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package ivy
;;   :demand
;;   :config
;;   (setq ivy-use-virtual-buffers t
;; 	enable-recursive-minibuffers t
;; 	ivy-height 30
;; 	ivy-extra-directories nil
;; 	ivy-re-builders-alist
;; 	'((t . ivy--regex-plus))
;; 	ivy-count-format "(%d/%d) ")
;;   (global-set-key (kbd "C-c i r") 'ivy-resume)
;;   )

;; (use-package ivy-hydra)

;; (use-package counsel
;;   :config
;;   (counsel-mode 1)
;;   (global-set-key (kbd "M-x") 'counsel-M-x)
;;   (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;   (global-set-key (kbd "C-M-f") 'counsel-rg)
;;   (global-set-key (kbd "C-M-r") 'counsel-recentf)
;;   (global-set-key (kbd "C-c h b") 'counsel-descbinds)
;;   (global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
;;   (global-set-key (kbd "C-x m") 'counsel-mark-ring)
;;   (setq counsel-find-file-ignore-regexp (regexp-opt '("./" "..")))
;;   )

;; (use-package swiper
;;   :config
;;   (global-set-key (kbd "C-c M-s") 'swiper)
;;   (global-set-key (kbd "C-c M-p") 'swiper-thing-at-point)
;;   (defun ad:swiper-thing-at-point ()
;;     "`swiper' with `ivy-thing-at-point'."
;;     (interactive)
;;     (let ((thing (if (thing-at-point-looking-at "^\\*+")
;;                      nil
;;                    (ivy-thing-at-point))))
;;       (when (use-region-p)
;;         (deactivate-mark))
;;       (swiper thing)))

;;   (advice-add 'swiper-thing-at-point :override #'ad:swiper-thing-at-point)
;; ;; (defun isearch-forward-or-swiper (use-swiper)
;;   ;;   (interactive "p")
;;   ;;   (let (current-prefix-arg)
;;   ;;     (call-interactively (if use-swiper 'swiper 'isearch-forward))))
;;   ;;   (global-set-key (kbd "C-s") 'isearch-forward-or-swiper)
;;   )
;; ;; directory を指定して rg やり直し．クエリは再利用する
;; (defun my-counsel-rg-in-dir (_arg)
;;   "Search again with new root directory."
;;   (let ((current-prefix-arg '(4)))
;;     (counsel-rg ivy-text nil ""))) ;; also disable extra-rg-args

;; (ivy-add-actions
;;  'counsel-rg
;;  '(("r" my-counsel-rg-in-dir "search in directory")))

;(use-package avy)

;; (use-package avy-migemo
;;    :config
;;    (avy-migemo-mode 1)
;;    (setq avy-timeout-seconds nil)
;;    (require 'avy-migemo-e.g.swiper)
;;    (global-set-key (kbd "C-M-;") 'avy-migemo-goto-char-timer)
;;    )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; vertico
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package vertico
 :init
 (vertico-mode)
 :config
 (setq vertico-count 20)
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; consult
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package consult
 :init
 :config
(consult-customize
  consult-theme
  :preview-key '(:debounce 0.2 any)
  consult-ripgrep consult-git-grep consult-grep
  consult-bookmark consult-recent-file consult-xref
  consult--source-bookmark consult--source-recent-file
  :preview-key (kbd "M-.")
  )
 :bind (
	("C-c h" . consult-history)
	("C-c m" . consult-mode-command)
	("C-c k" . consult-kmacro)
	("C-x M-:" . consult-complex-command)
	("C-x b" . consult-buffer)
	("C-x 4 b" . consult-buffer-other-window)
	("C-x 5 b" . consult-buffer-other-frame)
	("C-x r b" . consult-bookmark)
	("M-#" . consult-register-load)
	("M-'" . consult-register-store)
	("C-M-#" . consult-register)
	("<help> a" . consult-apropos)
	("M-g g" . consult-goto-line)
	("M-g M-g" . consult-goto-line)
	("M-g o" . consult-outline)
	("M-g m" . consult-mark)
	("M-g k" . consult-global-mark)
	("M-g i" . consult-imenu)
	("M-g I" . consult-imenu-multi)
	("M-s d" . consult-find)
	("M-s D" . consult-locate)
	("M-s g" . consult-grep)
	("M-s r" . consult-ripgrep)
	("M-s l" . consult-line)
	("M-s L" . consult-line-multi)
	("M-s m" . consult-multi-occur)
	("M-s k" . consult-keep-lines)
	("M-s u" . consult-focus-lines)
	("M-s e" . consult-isearch-history)
	:map isearch-mode-map
	("M-e" . consult-isearch-history)
	("M-s e" . consult-isearch-history)
	("M-s l" . consult-line)
	("M-s L" . consult-line-multi)
	:map minibuffer-local-map
	("M-s" . consult-history)
	("M-r" . consult-history)
	)
  ;; Enable automatic preview at point in the *Completions* buffer.
  :hook (completion-list-mode consult-preview-at-point-mode)
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; consult-dir
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package consult-dir
  :ensure t
  :bind (("C-x C-d" . consult-dir)
	 :map vertico-map
	 ("C-x C-d" . consult-dir)
	 ("M-d j" . consult-dir-jump-file)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; orderless
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package orderless
  :ensure t
  :init
  :custom
  (completion-styles '(orderless basic))
  :config
  (defun orderless-migemo (component)
    (let ((pattern (migemo-get-pattern component)))
      (condition-case nil
          (progn (string-match-p pattern "") pattern)
        (invalid-regexp nil))))

  (orderless-define-completion-style orderless-default-style
    (orderless-matching-styles '(orderless-literal
                                 orderless-regexp)))

  (orderless-define-completion-style orderless-migemo-style
    (orderless-matching-styles '(orderless-literal
                                 orderless-regexp
                                 orderless-migemo)))

  (setq completion-category-overrides
        '((command (styles orderless-default-style))
          (file (styles orderless-migemo-style))
          (buffer (styles orderless-migemo-style))
          (symbol (styles orderless-default-style))
          (consult-location (styles orderless-migemo-style)) ; category `consult-location' は `consult-line' などに使われる
          (consult-multi (styles orderless-migemo-style)) ; category `consult-multi' は `consult-buffer' などに使われる
          (unicode-name (styles orderless-migemo-style))
          (variable (styles orderless-default-style))))
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; marginalia
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package marginalia
  :ensure t
  :bind (("M-A" . marginalia-cycle)
	 :map minibuffer-local-map
	 ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode)
  (savehist-mode)
  :config
  ;; (add-to-list 'marginalia-prompt-categories
  ;; 	       '("\\<File\\>" . file))
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; embark
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwin)
   )
  )
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; popup-kill-ring
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package popup)
(use-package pos-tip)
(use-package popup-kill-ring
  :config
  (global-set-key "\M-y" 'popup-kill-ring)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; zero-dark theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package zerodark-theme
  :config
  (load-theme 'zerodark t)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; point-undo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package point-undo
  :config
  (require 'point-undo)
  (define-key global-map [f7] 'point-undo)
  (define-key global-map [S-f7] 'point-redo)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package markdown-mode
  :config
  (autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :config
  (use-package company-quickhelp)
  (require 'company)
  (global-company-mode +1)
  (custom-set-variables
   '(company-idle-delay nil)
   '(company-selection-wrap-around t))
  (global-set-key (kbd "M-\\") 'company-complete)
  ;; C-n, C-pで補完候補を次/前の候補を選択
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)

  ;; C-sで絞り込む
  (define-key company-active-map (kbd "C-s") 'company-filter-candidates)

  (define-key emacs-lisp-mode-map (kbd "M-\\") 'company-complete)
  (company-quickhelp-mode +1)
  (setq company-dabbrev-downcase nil)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; goto-chg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package goto-chg
  :config
  (require 'goto-chg)
  (global-set-key (kbd "<f8>") 'goto-last-change)
  (global-set-key (kbd "<M-f8>") 'goto-last-change-reverse)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; google-translate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package google-translate
  :config
  (require 'google-translate)
  (require 'google-translate-default-ui)

  (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
  (setq google-translate-backend-method 'curl)
  (defvar google-translate-english-chars "[:ascii:]’“”–"
    "これらの文字が含まれているときは英語とみなす")
  (defun google-translate-enja-or-jaen (&optional string)
    "regionか、現在のセンテンスを言語自動判別でGoogle翻訳する。"
    (interactive)
    (setq string
	  (cond ((stringp string) string)
		(current-prefix-arg
		 (read-string "Google Translate: "))
		((use-region-p)
		 (buffer-substring (region-beginning) (region-end)))
		(t
		 (save-excursion
		   (let (s)
		     (forward-char 1)
		     (backward-sentence)
		     (setq s (point))
		     (forward-sentence)
		     (buffer-substring s (point)))))))
    (let* ((asciip (string-match
		    (format "\\`[%s]+\\'" google-translate-english-chars)
		    string)))
      (run-at-time 0.1 nil 'deactivate-mark)
      (google-translate-translate
       (if asciip "en" "ja")
       (if asciip "ja" "en")
       string)))
					;(global-set-key (kbd "C-c t") 'google-translate-enja-or-jaen)

  (require 'url-util)

  (defun browser-translate ()
    "Open google translate with browser."
    (interactive)
    (if (use-region-p)
	(let ((string (buffer-substring-no-properties (region-beginning) (region-end))))
	  (deactivate-mark)
	  (if (string-match (format "\\`[%s]+\\'" "[:ascii:]")
			    string)
	      (browse-url (concat "https://translate.google.com/?source=gtx#en/ja/"
				  (url-hexify-string string)))
	    (browse-url (concat "https://translate.google.com/?source=gtx#ja/en/"
				(url-hexify-string string)))))
      (let ((string (read-string "Google Translate: ")))
	(if (string-match
	     (format "\\`[%s]+\\'" "[:ascii:]")
	     string)
	    (browse-url
	     (concat "https://translate.google.com/?source=gtx#en/ja/" (url-hexify-string string)))
	  (browse-url
	   (concat "https://translate.google.com/?source=gtx#ja/en/" (url-hexify-string string)))))))

  (global-set-key (kbd "C-c t") 'google-translate-enja-or-jaen)
					;(bind-key "C-c t" 'google-translate-enja-or-jaen)

  (defvar toggle-translate-flg nil "Toggle flg.")

  (defun toggle-translate ()
    "Toggle translate function."
    (interactive)
    (if toggle-translate-flg
	(progn
	  (global-set-key (kbd "C-c t") 'google-translate-enja-or-jaen)
					;(bind-key "C-c t" 'google-translate-enja-or-jaen)
	  (setq toggle-translate-flg nil))
      (progn
	(global-set-key (kbd "C-c t") 'browser-translate)
					;(bind-key "C-c t" 'browser-translate)
	(setq toggle-translate-flg t))))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package bm
  :config
  (require 'bm)
  (setq-default bm-buffer-persistence t)
  (setq bm-restore-repository-on-load t)
  (setq bm-cycle-all-buffers t)
  (setq bm-buffer-persistence t)
  (setq bm-persistent-face 'bm-face)
  (add-hook 'find-file-hooks #'bm-buffer-restore)
  (unless noninteractive
    (bm-repository-load)
    (add-hook 'kill-buffer-hook 'bm-buffer-save)
    (add-hook 'after-save-hook 'bm-buffer-save)
    (add-hook 'after-revert-hook 'bm-buffer-restore)
    (add-hook 'kill-emacs-hook '(lambda nil
				  (bm-buffer-save-all)
				  (bm-repository-save))))
  (global-set-key (kbd "M-SPC") 'bm-toggle)
  (global-set-key (kbd "M-[") 'bm-previous)
  (global-set-key (kbd "M-]") 'bm-next)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; js2-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package js2-mode
;;  :ensure t
  :config
  ;;(require 'js2-mode)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; visual basic mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package visual-basic-mode
  :config
  (load-library "visual-basic-mode")
  (add-to-list 'auto-mode-alist
	       '("\\.\\(frm\\|bas\\|cls\\|vbs\\|asp\\)$" . visual-basic-mode))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flycheck
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package flycheck
  :config
  (global-flycheck-mode)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smart-mode-line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'dark)
					;(defvar sml/theme 'respectful)
  (setq sml/shorten-directory -1)
  (setq sml/read-only-char "%%")
  (setq sml/modified-char "*")
  (setq sml/hidden-modes '("Helm"))
  (setq sml/extra-filler -10)
  (sml/setup)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; geiser
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package geiser
  :config
  (require 'geiser)
  (setq geiser-scheme-dir "/home/ymine/.emacs.d/straight/build/geiser/scheme")
  ;;(setq geiser-active-implementations '(racket))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-journal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package org-journal)
;; (customize-set-variable 'org-journal-dir "~/org/journal/")
;; (customize-set-variable 'org-journal-date-format "%x (%a)")
;; (customize-set-variable 'org-journal-time-format "< %R >\n ")
;; (require 'org-journal)
(use-package org-journal
  :init
  (customize-set-variable 'org-journal-dir "~/org/journal/")
  (customize-set-variable 'org-journal-date-format "%Y/%m/%d")
  (customize-set-variable 'org-journal-time-format "< %R >\n ")
  :config
  (require 'org-journal)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; japanese-hokiday
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package japanese-holidays)
;; (add-hook 'calendar-today-visible-hook   'japanese-holiday-mark-weekend)
;; (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)
;; (add-hook 'calendar-today-visible-hook   'calendar-mark-today)
;; (setq calendar-holidays               ; とりあえず日本のみを表示
;;         (append japanese-holidays holiday-local-holidays))
;; (setq mark-holidays-in-calendar t)     ; 祝日をカレンダーに表示
;; (setq calendar-month-name-array       ; 月と曜日の表示調整
;;       ["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" ])
;; (setq calendar-day-name-array
;;       ["日" "月" "火" "水" "木" "金" "土"])
;; (setq calendar-day-header-array
;;       ["日" "月" "火" "水" "木" "金" "土"])
;; (setq calendar-date-style 'iso)         ; ISO format (YYYY/MM/DD) に変更
;; (setq japanese-holiday-weekend '(0 6))  ; 土曜日・日曜日を祝日として表示
;; (setq japanese-holiday-weekend-marker
;;       '(holiday nil nil nil nil nil japanese-holiday-saturday)
;;       ;; 日曜開始
;;       calendar-week-start-day 0)
;; (calendar-set-date-style 'iso)
;; (require 'japanese-holidays)
(use-package japanese-holidays
  :init
  (add-hook 'calendar-today-visible-hook   'japanese-holiday-mark-weekend)
  (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)
  (add-hook 'calendar-today-visible-hook   'calendar-mark-today)
  :config
  (require 'japanese-holidays)
  (setq calendar-holidays               ; とりあえず日本のみを表示
        (append japanese-holidays holiday-local-holidays)
        mark-holidays-in-calendar t     ; 祝日をカレンダーに表示
        calendar-month-name-array       ; 月と曜日の表示調整
        ["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" ]
        calendar-day-name-array
        ["日" "月" "火" "水" "木" "金" "土"]
        calendar-day-header-array
        ["日" "月" "火" "水" "木" "金" "土"]
        calendar-date-style 'iso         ; ISO format (YYYY/MM/DD) に変更
        japanese-holiday-weekend '(0 6)  ; 土曜日・日曜日を祝日として表示
        japanese-holiday-weekend-marker
        '(holiday nil nil nil nil nil japanese-holiday-saturday)
        ;; 日曜開始
        calendar-week-start-day 0)
  (calendar-set-date-style 'iso)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; paren
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package paren
    :ensure nil
    :hook
    (after-init . show-paren-mode)
    :custom-face
    (show-paren-match ((nil (:background "#44475a" :foreground "#f1fa8c"))))
    :custom
    (show-paren-style 'mixed)
    (show-paren-when-point-inside-paren t)
    (show-paren-when-point-in-periphery t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rg.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package rg
  :config
  (rg-enable-default-bindings)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magit
  :bind (
	 ("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup)
	 )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fold-this.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package fold-this
  :config
  (require 'fold-this)
  (global-set-key (kbd "C-c C-f") 'fold-this-all)
  (global-set-key (kbd "C-c C-F") 'fold-this)
  (global-set-key (kbd "C-c M-F") 'fold-this-unfold-all)
  )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; neotree
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package all-the-icons)
;; (use-package neotree
;;   :config
;;   ;; 隠しファイルをデフォルトで表示
;;   (global-set-key [f8] 'neotree-toggle)
;;   (setq neo-smart-open t)           ;; neotreeを開いた時のカレントファイルのディレクトリを表示する
;;   (setq neo-show-hidden-files t)    ;; 隠しファイルをデフォルトで表示
;; ;;  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;;   )

;;; 90-my-packages.el ends here
