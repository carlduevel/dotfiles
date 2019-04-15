(setq-default evil-escape-delay 0.2)
(setq-default evil-escape-key-sequence "jk")

(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

(add-hook 'text-mode-hook 'auto-fill-mode)

(global-evil-mc-mode 1)

(add-hook 'org-mode-hook 'org-indent-mode)

(require 'org)
(setq gtd-dir "~/Dropbox/org/gtd/")
(setq inbox-file (concat gtd-dir "inbox.org"))
(setq gtd-file (concat gtd-dir "gtd.org"))
(setq tickler-file (concat gtd-dir "tickler.org"))
(setq org-agenda-files (list
                        inbox-file
                        gtd-file
                        tickler-file))
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-prewarning-if-scheduled t)
(setq org-agenda-skip-deadline-if-done t)



(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE")
        (sequence "PROJECT" "AGENDA" "|" "MINUTES")
        (sequence "WAITING" "|" "PROGRESS")))


(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq org-refile-use-outline-path 'file)

(setq org-agenda-custom-commands
      '(("h" "@home" tags-todo "@home")
        ("c" "@computer" tags-todo "@computer")
        ("H" "+hasi" tags-todo "+hasi")
        ("p" "@phone" tags-todo "@phone")
        ("b" "@BO" tags-todo "@BO")))

(setq org-default-notes-file  inbox-file)
(define-key global-map "\C-cc" 'org-capture)

(require 'org-protocol)


(setq org-capture-templates '(("t" "Todo" entry
                               (file+headline  inbox-file "Misc")"* TODO %i%?")
                              ("i" "Idea" entry
                               (file  "~/Dropbox/org/ideas.org")"* %i%?")
                              ("p" "Protocol" entry
                               (file+headline inbox-file "Inbox")
                               "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
                              ("L" "Protocol Link" entry
                               (file+headline inbox-file "Inbox")
                               "* %? [[%:link][%:description]] \nCaptured on: %U")
                              ("T" "Tickler" entry
                               (file+headline tickler-file "Tickler")
                               "* %i%? \n %U")))
