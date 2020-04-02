
(use-package auto-complete
  :ensure t
  :config
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

(use-package yasnippet
  :ensure t
  :config
    (yas-global-mode 1))

(use-package undo-tree
  :ensure t
  :config
    (global-undo-tree-mode))

(use-package smartparens
  :ensure t
  :config
    (require 'smartparens-config))
