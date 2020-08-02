
; ----------------------------------------------------
; https://github.com/ganmacs/emacs-surround
; Usage
;       change surround: C-q {symbolORIG}{symbolNEW}
;       insert surround: C-q i{symbol}
;       delete surround: C-q d{symbol}
(add-to-list 'load-path "/home/alex/Config/dotEmacs/dotEmacsDir/experimental/emacs-surround")
(require 'emacs-surround)
(global-set-key (kbd "C-q") 'emacs-surround)
