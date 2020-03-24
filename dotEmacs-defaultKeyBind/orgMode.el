
(setq org-startup-folded nil)
(setq org-startup-indented 't)

(load-library "find-lisp")
(add-hook 'org-agenda-mode-hook
          (lambda ()
            (setq org-agenda-files (find-lisp-find-files
                                    "~/Dropbox/Journal"
                                    "\\.org$"))))

(setq org-tag-alist '(("EXPENSE" . ?e)
                      ("MOOD" . ?m)
                      ("HEALTH" . ?h)
                      ("IDEA" . ?i)
                      ("FOLLOWUP" . ?f)
                      ("KATIE" . ?k)
                      ("CAROL" . ?c)
                      ("SUMMARY" . ?s)
                      ("BPCP" . ?p)
                      ("X220" . ?x)
                      ))

(setq org-todo-keywords
      '((sequence "TODO(t!)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))

(setq org-log-into-drawer 't)

(setq org-log-into-drawer 't)

(setq org-capture-templates
  (quote (("t" "todo" entry (file+olp+datetree
    "~/Dropbox/Journal/Personal/capture.org")
    "* TODO  %?\n- Created %U\n")
    ("n" "note" entry (file+olp+datetree
      "~/Dropbox/Journal/Personal/capture.org")
      "* %? :NOTE:\n" :clock-in t :clock-resume t)
)))

(setq org-export-with-sub-superscripts nil)
