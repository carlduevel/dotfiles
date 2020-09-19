(setq org-roam-packages
      '(org-roam (company-org-roam :requires company) org-roam-server))

(defun org-roam/init-org-roam ()
  (use-package org-roam
    :hook
    (after-init . org-roam-mode)
    :config
    (setq org-roam-completion-system 
          (cond
           ((fboundp 'ivy-mode)
            'ivy)
           ((fboundp 'helm-mode)
            'helm)
           ((fboundp 'ido-mode)
            'ido)
           ('default)))
    :init
    (progn
      (spacemacs/declare-prefix "ar" "org-roam")
      (spacemacs/set-leader-keys
        "arl" 'org-roam
        "art" 'org-roam-dailies-today
        "arf" 'org-roam-find-file
        "arg" 'org-roam-graph)

      (spacemacs/declare-prefix-for-mode 'org-mode "mr" "org-roam")
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "rl" 'org-roam
        "rt" 'org-roam-dailies-today
        "rb" 'org-roam-switch-to-buffer
        "rf" 'org-roam-find-file
        "ri" 'org-roam-insert
        "rg" 'org-roam-graph)))
  ;; Since the org module lazy loads org-protocol (waits until an org URL is
  ;; detected), we can safely chain `org-roam-protocol' to it.
  (use-package org-roam-protocol
    :after org-protocol))



(defun org-roam/init-company-org-roam ()
  (use-package company-org-roam
    :after org-roam
    :init
    (spacemacs|add-company-backends
      :backends company-org-roam
      :modes org-mode)))

(defun org-roam/init-org-roam-server ()
  (use-package org-roam-server
    :config
    (setq org-roam-server-host "127.0.0.1"
          org-roam-server-port 8080
          org-roam-server-export-inline-images t
          org-roam-server-authenticate nil
          org-roam-server-network-poll t
          org-roam-server-network-arrows nil
          org-roam-server-network-label-truncate t
          org-roam-server-network-label-truncate-length 60
          org-roam-server-network-label-wrap-length 20)))



