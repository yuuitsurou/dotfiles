;; (straight-use-package 'ddskk)
;; (setq skk-server-host "localhost"
;; 	  skk-server-portnum 1178
;; 	  skk-server-report-response nil)
;; (setq skk-large-jisyo nil)
;; (when (require 'skk nil t)
;;   (global-set-key "\C-\\" 'skk-mode))
;; ;; 変換開始のキーを ; に
;; (setq skk-sticky-key ";")
;; ;; Enter キーを押したときに確定
;; (setq skk-egg-like-newline t)
;; ;;
;; (setq skk-japanese-message-and-error t) ; エラーを日本語に
;; (setq skk-show-japanese-menu t)		; メニューを日本語に
;; ;; 確定のアンドゥ
;; (define-key skk-j-mode-map (kbd "C-M-j") 'skk-undo-kakutei)
;; ;; 変換候補を2列
;; ;(setq skk-henkan-show-candidates-rows 2)

;; ;; アノテーション
;; (setq skk-show-annotation t)
;; ;; モードラインにSKKアイコンを表示
;; (setq skk-show-icon t)
;; ;(require 'skk-study)
;; ;; 閉じカッコを自動的に挿入
;; (setq skk-auto-insert-paren t)
;; ;(setq skk-dcomp-activate t)
;; ;(setq skk-dcomp-multiple-activate t) ; 動的補完の複数候補表示
;; ;(setq skk-dcomp-multiple-rows 10)    ; 動的補完の候補表示件数
;; (setq skk-iserach-start-mode 'latin)
;; ;; 半角カナ入力
;; (setq skk-use-jisx0201-input-method t)
;; (setq skk-share-private-jisyo t)
;; ;; 送り仮名が厳密に正しい候補を優先して表示
;; (setq skk-henkan-strict-okuri-precedence t)
;; ;; 辞書登録のとき、余計な送り仮名を送らない
;; (setq skk-check-okurigana-on-toroku 'auto)
;; (setq skk-use-look t)
;; (when skk-use-look
;;   (setq skk-look-recursive-search t)
;;   (setq skk-look-use-ispell nil)
;;   (add-hook 'skk-search-excluding-word-pattern-function
;; 	    ;; KAKUTEI-WORD を引数にしてコールされるので、不要でも引数を取る
;; 	    ;; 必要あり
;; 	    #'(lambda (kakutei-word)
;; 		(and skk-abbrev-mode
;; 		     (save-match-data
;; 		       ;; `skk-henkan-key' が "*" で終わるとき、または
;; 		       ;; `skk-henkan-key' が数字のみのとき
;; 		       (or (string-match "\\*$" skk-henkan-key)
;; 			   (string-match "^[0-9]*$" skk-henkan-key)))))))

;; (require 'skk-hint)
;; (setq skk-hint-start-char 58)
;; ;(setq skk-show-inline t)
;; ;(setq skk-show-tooltip t)
;; (setq skk-show-candidates-always-pop-to-buffer t)
;; ;; 10 分放置すると個人辞書が自動的に保存される設定
;; (defvar skk-auto-save-jisyo-interval 600)
;; (defun skk-auto-save-jisyo ()
;;   (skk-save-jisyo)
;;   ;; skk-bayesian.el を使っていなければ以下の 2 行はコメントアウト
;;   ;; (skk-bayesian-save-history)
;;   ;; (skk-bayesian-corpus-save)
;;   )
;; (run-with-idle-timer skk-auto-save-jisyo-interval
;; 		     skk-auto-save-jisyo-interval
;; 		     'skk-auto-save-jisyo)
;; ;; (cancel-function-timers 'skk-auto-save-jisyo)

;; ;; 単語登録／単語削除のたびに個人辞書を保存する
;; (setq skk-save-jisyo-instantly t)
;; (define-key minibuffer-local-map (kbd "C-j") 'skk-kakutei)
(use-package mozc
  :config
  (setq default-input-method "japanese-mozc")
 )
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
  (setq migemo-options '("-q" "--emacs"))
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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; helm
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package helm
;;   :config
;;   (require 'helm-config)
;;   (helm-mode 1)
;;   (helm-migemo-mode 1)
;;   ;; helm を適用しないコマンド
;;   ;;(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
;;   ;; helm-source-buffers-list のバッファ名を表示する幅
;;   (setq helm-buffer-max-length 50)
;;   ;; helm-follow-mode の前回の状態を維持する
;;   (setq helm-follow-mode-persistent t)
;;   ;; 自動補完を無効にする
;;   (setq helm-ff-auto-update-initial-value nil)
;;   ;; TAB で補完する
;;   (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;;   (define-key helm-map (kbd "C-]") 'helm-execute-persistent-action)
;;   (define-key helm-map (kbd "C-:") 'helm-select-action)
;;   ;;(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
;;   ;;(define-key helm-find-files-map (kbd "<tab>") 'helm-execute-persistent-action)

;;   (define-key helm-map (kbd "C-h") 'delete-backward-char)
;;   (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;;   ;; key setteings
;;   ;;(global-set-key (kbd "C-c h") 'helm-mini)
;;   (global-set-key (kbd "M-x") 'helm-M-x)
;;   ;;(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;;   (global-set-key (kbd "C-x C-;") 'helm-for-files)
;;   (global-set-key (kbd "C-M-o") 'helm-occur)
;;   ;; プレフィックスキー C-;
;;   ;;(custom-set-variables '(helm-command-prefix-key "C-;"))
;;   (global-set-key (kbd "C-;") 'helm-command-prefix)
;;   (global-unset-key (kbd "C-x c"))
;;   ;; キーバインドを設定する。C-; でコマンド起動後は、以下のキーが利用可能となる
;;   ;;  M-n     ：カーソル位置の単語を検索パターンに追加
;;   ;;  C-z     ：チラ見
;;   ;;  C-c C-f ：helm-follow-mode の ON/OFF
;;   (define-key helm-command-map (kbd "h") 'helm-mini)
;;   (define-key helm-command-map (kbd "C-;") 'helm-resume)
;;   (define-key helm-command-map (kbd "f")   'helm-find-files)
;;   (define-key helm-command-map (kbd "y")   'helm-show-kill-ring)
;;   (define-key helm-command-map (kbd "d")   'helm-descbinds)
;;   (define-key helm-command-map (kbd "b")   'helm-buffers-list)
;;   (define-key helm-command-map (kbd "i")   'helm-imenu)
;;   (define-key helm-command-map (kbd "M")   'helm-semantic-or-imenu)
;;   (define-key helm-command-map (kbd "o")   'helm-org-agenda-files-headings)

;;   (when (executable-find "curl")
;;     (setq helm-google-suggest-use-curl-p t))

;;   (setq helm-split-window-in-side-p t
;; 					; helm-move-to-line-cycle-in-source t
;; 	helm-ff-search-library-in-sexp t
;; 	helm-scroll-amount 8
;; 	helm-ff-file-name-history-use-recentf t
;; 	helm-echo-input-in-header-line t)

;;   ;; Emulate `kill-line' in helm minibuffer
;;   (setq helm-delete-minibuffer-contents-from-point t)
;;   (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
;;     "Emulate `kill-line' in helm minibuffer"
;;     (kill-new (buffer-substring (point) (field-end))))
;;   ;; helm-delete-minibuffer-contents-from-point（ミニバッファで C-k 入力時にカーソル以降を
;;   ;; 削除する)を設定すると、pattern 文字入力後に action が表示されない症状が出ることの対策
;;   (defadvice helm-select-action (around ad-helm-select-action activate)
;;     (let ((helm-delete-minibuffer-contents-from-point nil))
;;       ad-do-it))
;; )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; helm
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package helm-descbinds)
;; ;; (require 'helm-descbinds)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; helm swoop
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package helm-swoop
;;   :config
;;   ;;(require 'helm-swoop)
;;   (helm-migemo-mode 1)
;;   ;; キーバインドはお好みで
;;   (global-set-key (kbd "M-p") 'helm-swoop)
;;   (global-set-key (kbd "M-P") 'helm-swoop-back-to-last-point)
;;   (global-set-key (kbd "C-c M-p") 'helm-multi-swoop)
;;   (global-set-key (kbd "C-x M-p") 'helm-multi-swoop-all)

;;   ;; isearch実行中にhelm-swoopに移行
;;   (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;;   ;; helm-swoop実行中にhelm-multi-swoop-allに移行
;;   (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;;   ;; Save buffer when helm-multi-swoop-edit complete
;;   (setq helm-multi-swoop-edit-save t)

;;   ;; tの場合はウィンドウ内に分割、nilなら別のウィンドウを使用
;;   (setq helm-swoop-split-with-multiple-windows t)

;;   ;; ウィンドウ分割方向 'split-window-vertically or 'split-window-horizontally
;;   (setq helm-swoop-split-direction 'split-window-vertically)

;;   ;; nilなら一覧のテキストカラーを失う代わりに、起動スピードをほんの少し上げる
;;   (setq helm-swoop-speed-or-color t)

;;   (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
;;   (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
;;   (cl-defun helm-swoop-nomigemo (&key $query ($multiline current-prefix-arg))
;;     "シンボル検索用Migemo無効版helm-swoop"
;;     (interactive)
;;     (let ((helm-swoop-pre-input-function
;; 	   (lambda () (format "\\_<%s\\_> " (thing-at-point 'symbol)))))
;;       (helm-swoop :$source (delete '(migemo) (copy-sequence (helm-c-source-swoop)))
;; 		  :$query $query :$multiline $multiline)))
;; ;;; C-M-:に割り当て
;;   (global-set-key (kbd "C-M-:") 'helm-swoop-nomigemo)
;; )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; helm-ag
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package helm-ag
;;   :config
;;   ;;(require 'helm-ag)
;;   (setq helm-ag-base-command "rg --no-heading --line-number --color never")
;;   ;; 現在のシンボルをデフォルトのクエリにする
;;   (setq helm-ag-insert-at-point 'symbol)
;;   ;;
;;   (global-set-key (kbd "C-M-g") 'helm-ag)
;;   (global-set-key (kbd "C-M-G") 'helm-do-ag)
;;   (global-set-key (kbd "C-M-k") 'backward-kill-sexp)

;;   (defun helm-ag-dot-emacs ()
;;     ".emacs.d以下を検索"
;;     (interactive)
;;     (helm-ag "~/.emacs.d/"))
;; )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ivy / counsel / swiper
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ivy
  :demand
  :config
  (setq ivy-use-virtual-buffers t
	enable-recursive-minibuffers t
	ivy-height 30
	ivy-extra-directories nil
	ivy-re-builders-alist
	'((t . ivy--regex-plus))
	ivy-count-format "(%d/%d) ")
  (global-set-key (kbd "C-c i r") 'ivy-resume)
  )

(use-package ivy-hydra)

(use-package counsel
  :config
  (counsel-mode 1)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-M-f") 'counsel-rg)
  (global-set-key (kbd "C-M-r") 'counsel-recentf)
  (global-set-key (kbd "C-c h b") 'counsel-descbinds)
  (global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
  (global-set-key (kbd "C-x m") 'counsel-mark-ring)
  (setq counsel-find-file-ignore-regexp (regexp-opt '("./" "..")))
  )

(use-package swiper
  :config
  (global-set-key (kbd "C-c M-s") 'swiper-thing-at-point)
  (defun ad:swiper-thing-at-point ()
    "`swiper' with `ivy-thing-at-point'."
    (interactive)
    (let ((thing (if (thing-at-point-looking-at "^\\*+")
                     nil
                   (ivy-thing-at-point))))
      (when (use-region-p)
        (deactivate-mark))
      (swiper thing)))

  (advice-add 'swiper-thing-at-point :override #'ad:swiper-thing-at-point)
;; (defun isearch-forward-or-swiper (use-swiper)
  ;;   (interactive "p")
  ;;   (let (current-prefix-arg)
  ;;     (call-interactively (if use-swiper 'swiper 'isearch-forward))))
  ;;   (global-set-key (kbd "C-s") 'isearch-forward-or-swiper)
  )
;; directory を指定して rg やり直し．クエリは再利用する
(defun my-counsel-rg-in-dir (_arg)
  "Search again with new root directory."
  (let ((current-prefix-arg '(4)))
    (counsel-rg ivy-text nil ""))) ;; also disable extra-rg-args

(ivy-add-actions
 'counsel-rg
 '(("r" my-counsel-rg-in-dir "search in directory")))
;; (use-package avy)

;; (use-package avy-migemo
;;    :config
;;    (avy-migemo-mode 1)
;;    (setq avy-timeout-seconds nil)
;;    (require 'avy-migemo-e.g.swiper)
;;    (global-set-key (kbd "C-M-;") 'avy-migemo-goto-char-timer)
;;    )

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
;;; 90-my-packages_win.el end here
