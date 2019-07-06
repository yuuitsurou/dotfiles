(use-package ddskk :ensure)
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
;; 確定のアンドゥ
(define-key skk-j-mode-map (kbd "C-M-j") 'skk-undo-kakutei)
;; アノテーション
(setq skk-show-annotation t)
;; モードラインにSKKアイコンを表示
(setq skk-show-icon t)
;(require 'skk-study)
;; 閉じカッコを自動的に挿入
(setq skk-auto-insert-paren t)
;(setq skk-dcomp-activate t)
;(setq skk-dcomp-multiple-activate t) ; 動的補完の複数候補表示
;(setq skk-dcomp-multiple-rows 10)    ; 動的補完の候補表示件数
(setq skk-iserach-start-mode 'latin)
;; 半角カナ入力
(setq skk-use-jisx0201-input-method t)
(setq skk-share-private-jisyo t)
;; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
;; 辞書登録のとき、余計な送り仮名を送らない
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
;(setq skk-show-inline t)
;(setq skk-show-tooltip t)
(setq skk-show-candidates-always-pop-to-buffer t)
;; 10 分放置すると個人辞書が自動的に保存される設定
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
;; (cancel-function-timers 'skk-auto-save-jisyo)

;; 単語登録／単語削除のたびに個人辞書を保存する
(setq skk-save-jisyo-instantly t)
