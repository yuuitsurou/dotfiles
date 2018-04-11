;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-config)
(helm-mode 1)
(helm-migemo-mode 1)
;; helm を適用しないコマンド
;;(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
;; helm-source-buffers-list のバッファ名を表示する幅
(setq helm-buffer-max-length 50)
;; 自動補完を無効にする
(setq helm-ff-auto-update-initial-value nil)
;; TAB で補完する
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-]") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-:") 'helm-select-action)
;(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
;; key setteings
;(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
;(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-;") 'helm-for-files)
(global-set-key (kbd "C-M-o") 'helm-occur)
;; プレフィックスキー C-;
;;(custom-set-variables '(helm-command-prefix-key "C-;"))
(global-set-key (kbd "C-;") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
;; キーバインドを設定する。C-; でコマンド起動後は、以下のキーが利用可能となる
;;  M-n     ：カーソル位置の単語を検索パターンに追加
;;  C-z     ：チラ見
;;  C-c C-f ：helm-follow-mode の ON/OFF
(define-key helm-command-map (kbd "h") 'helm-mini)
(define-key helm-command-map (kbd "C-;") 'helm-resume)
(define-key helm-command-map (kbd "f")   'helm-find-files)
(define-key helm-command-map (kbd "y")   'helm-show-kill-ring)
(define-key helm-command-map (kbd "d")   'helm-descbinds)
(define-key helm-command-map (kbd "b")   'helm-buffers-list)
(define-key helm-command-map (kbd "i")   'helm-imenu)
(define-key helm-command-map (kbd "C-i") 'helm-semantic-or-imenu)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p t
      ; helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
      helm-scroll-amount 8
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))
;; helm-delete-minibuffer-contents-from-point（ミニバッファで C-k 入力時にカーソル以降を
;; 削除する)を設定すると、pattern 文字入力後に action が表示されない症状が出ることの対策
(defadvice helm-select-action (around ad-helm-select-action activate)
  (let ((helm-delete-minibuffer-contents-from-point nil))
    ad-do-it))

(setq helm-surfraw-default-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")
