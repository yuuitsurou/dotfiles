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
