;; https://www.youtube.com/watch?v=49kBWM3RQQ8

;; ============================================
;; Minimal startup
;; ============================================
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; ============================================
;; OS dependent key bindings
;; ============================================
(when (eq system-type 'darwin) ;; mac specific settings
  ;; (setq mac-option-key-is-meta t)
  ;; (setq mac-option-modifier 'meta)
  ;; (setq mac-command-key-is-meta nil)
  ;; (setq mac-command-modifier nil)


  ;; http://ergoemacs.org/emacs/emacs_hyper_super_keys.html
  ;; ------------------------------------------
  ;; set keys for Apple keyboard, for emacs in OS X
  (setq mac-command-modifier 'super) ; make cmd key do Meta
  (setq mac-option-modifier 'meta) ; make opt key do Super
  (setq mac-control-modifier 'control) ; make Control key do Control
  (setq ns-function-modifier 'hyper)  ; make Fn key do Hyper
  ;; .........................................
  ;; Mapping Commonly used OSX Quick Keys
  (global-set-key (kbd "s-z") 'undo-tree-visualize)
  (global-set-key (kbd "s-x") 'kill-region)
  (global-set-key (kbd "s-c") 'kill-ring-save)
  (global-set-key (kbd "s-v") 'yank)
  (global-set-key (kbd "s-V") 'yank-pop)
  ;; .........................................
  (global-set-key (kbd "s-s") 'save-buffer)
  (global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
  ;; .........................................
  (global-set-key (kbd "s-=") 'text-scale-increase)
  (global-set-key (kbd "s--") 'text-scale-decrease)
  ;; .........................................
  (global-set-key (kbd "s-<left>")  'previous-buffer)
  (global-set-key (kbd "s-<right>") 'next-buffer)

  ;; .........................................
  ;; esc always quits
  ;; https://superuser.com/questions/669902/is-it-possible-to-get-esc-to-behave-as-an-actual-escape-key/945245#945245
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  ;; (global-set-key [escape] 'keyboard-quit)
  (global-set-key [escape] 'keyboard-escape-quit)

  ;; .........................................
  ;; The following are my vim Leader commands
  (global-set-key (kbd "s-\\") 'toggle-truncate-lines)
  (global-set-key (kbd "s-e")  'treemacs)
  (global-set-key (kbd "s-l")  'whitespace-mode)

  ;; .........................................
  ;; Mode specific keybindings
  (add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "s-p") 'org-export-dispatch)))
  
  ;; C-x C-+ increase font size
  ;; C-x C-0 default size
  ;; C-x C-- decrease font size
  (setq default-frame-alist '((font . "Menlo-16")))
)

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
(org-babel-load-file (expand-file-name "~/Config/dotEmacs/dotEmacs-defaultKeyBind/convenienceFeatures.org"))
(org-babel-load-file (expand-file-name "~/Config/dotEmacs/dotEmacs-defaultKeyBind/orgMode.org"))
(org-babel-load-file (expand-file-name "~/Config/dotEmacs/dotEmacs-defaultKeyBind/themes.org"))

(org-babel-load-file (expand-file-name "~/Config/dotEmacs/dotEmacs-defaultKeyBind/experimental.org"))



;; ============================================
;; User Interface
;; ============================================
;; Turn off sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)


;; ============================================
;; Aliases
;; ============================================
(defalias 'list-buffers 'ibuffer)

;; Simplfy the yes-no response
(defalias 'yes-or-no-p 'y-or-n-p)

(defalias 'hsplit 'split-window-below)
(defalias 'vsplit 'split-window-right)



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
