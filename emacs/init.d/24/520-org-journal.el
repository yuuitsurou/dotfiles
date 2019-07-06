;; (use-package org-journal)
;; (customize-set-variable 'org-journal-dir "~/org/journal/")
;; (customize-set-variable 'org-journal-date-format "%x (%a)")
;; (customize-set-variable 'org-journal-time-format "< %R >\n ")
;; (require 'org-journal)
(use-package org-journal
  :init
  (customize-set-variable 'org-journal-dir "~/org/journal/")
  (customize-set-variable 'org-journal-date-format "%x (%a)")
  (customize-set-variable 'org-journal-time-format "< %R >\n ")
  :config
  (require 'org-journal)
)
