(defconst thesaurus-packages
  '(synosaurus))

(defun thesaurus/init-synosaurus ()
  (use-package synosaurus
    :hook (text-mode . synosaurus-mode)
    :init
    (spacemacs/set-leader-keys 
      "oc" 'synosaurus-choose-and-replace
      "og" 'thesaurus/german
      "oe" 'thesaurus/english)))

(defun thesaurus/german ()
  (interactive)
  (setq synosaurus-backend 'synosaurus-backend-openthesaurus))


(defun thesaurus/english ()
  (interactive)
   (setq synosaurus-backend 'synosaurus-backend-wordnet))
