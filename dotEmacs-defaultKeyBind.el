;; https://www.youtube.com/watch?v=49kBWM3RQQ8

;; ============================================
;; Minimail startup
;; ============================================
(setq inhibit-startup-message t)
(menu-bar-mode -1)

(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; ============================================
;; Set emacs to use Melpa
;; ============================================
;; usage:
;;	M-x package-refresh
;;	M-x list-packages
;;	M-x describe-package
;; --------------------------------------------
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	'("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;; ============================================
;; Key packages
;; ============================================
;; try:
;;	allows you to try a package without installing
;; usage:
;;	M-x try
;; --------------------------------------------
(use-package try
	:ensure t)
;; ............................................
;; which-key:
;;	Upon hitting C-x, a list of possible command shows
;; --------------------------------------------
(use-package which-key
	:ensure t
	:config (which-key-mode))
;; ............................................
;; ido
;; --------------------------------------------
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)
;; ............................................
;; ace-window:
;; 	C-x 0 will number each window for jumping
;; --------------------------------------------
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
;; ............................................
;; ivy /council / swiper:
;;	Replacement for C-s and C-r to search for terms
;; 	Note: Ivy is a replacement for ido (per author)
;;	Use :bind to set the keys for each package
;; --------------------------------------------
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

;; ============================================
;; Aliases
;; ============================================
(defalias 'list-buffers 'ibuffer)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EOF
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (counsel ivy ace-window which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
