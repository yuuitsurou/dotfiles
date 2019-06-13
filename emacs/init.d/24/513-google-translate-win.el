;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; google-translate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'google-translate)
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
	    (browse-url-default-windows-browser (concat "https://translate.google.com/?source=gtx#en/ja/"
				(url-hexify-string string)))
	  (browse-url-default-windows-browser (concat "https://translate.google.com/?source=gtx#ja/en/"
			      (url-hexify-string string)))))
    (let ((string (read-string "Google Translate: ")))
      (if (string-match
	   (format "\\`[%s]+\\'" "[:ascii:]")
	   string)
	  (browse-url-default-windows-browser
	   (concat "https://translate.google.com/?source=gtx#en/ja/" (url-hexify-string string)))
	(browse-url-default-windows-browser
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


