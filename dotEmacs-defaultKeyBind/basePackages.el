
(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    ;; The following creates large numbers
    ;; but it only works in the GUI
    ;;    (custom-set-faces
    ;;     '(aw-leading-char-face
    ;;       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-user-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  )
;; ............................................
(use-package counsel
  :ensure t
  )
;; ............................................
(use-package swiper
  :ensure try
  :bind (("C-s" . swiper)
         ("C-r" . swiper)
         ("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    ;; (setq enable-recursive-minibuffers t)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))
