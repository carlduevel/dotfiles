(defconst thesaurus-packages
  '(synosaurus))

(defun thesaurus/init-synosaurus ()
  (use-package synosaurus
    :hook (text-mode . synosaurus-mode)
    :init
    (spacemacs/set-leader-keys 
      "xs" 'synosaurus-choose-and-replace)))

