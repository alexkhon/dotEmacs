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

;; Simplfy the yes-no response
;;(fset yes-or-no-p 'y-or-n-p)

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
;; Load and configure packages
;; ============================================
(org-babel-load-file (expand-file-name "~/Config/dotEmacs/dotEmacs-defaultKeyBind/basePackages.org"))
(org-babel-load-file (expand-file-name "~/Config/dotEmacs/dotEmacs-defaultKeyBind/convenienceFeatures.org")
(org-babel-load-file (expand-file-name "~/Config/dotEmacs/dotEmacs-defaultKeyBind/orgMode.org"))

;; ============================================
;; Aliases
;; ============================================
(defalias 'list-buffers 'ibuffer)


(add-hook 'text-mode-hook 'turn-on-visual-line-mode)


;; ============================================
;; Centralized back up
;; ============================================
(if (file-directory-p "~/.emacs.d/backup")
  (setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
  (message "Directory does not exist: ~/.emacs.d/backup"))

(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))



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
