;; (use-package org-journal)
;; (customize-set-variable 'org-journal-dir "~/org/journal/")
;; (customize-set-variable 'org-journal-date-format "%x (%a)")
;; (customize-set-variable 'org-journal-time-format "<%R> ")
;; (require 'org-journal)
(use-package org-journal
  :ensure t
  :custom
  (org-journal-dir "~/org/journal/")
  (org-journal-date-format "%x (%a)")
  (org-journal-time-format "< %R >\n ")
)
