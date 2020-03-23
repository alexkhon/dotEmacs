#!/bin/bash

rm $HOME/.emacs
ln -s $HOME/Config/dotEmacs/dotEmacs-defaultKeyBind.el $HOME/.emacs
rm $HOME/.emacs.d
ln -s $HOME/Config/dotEmacs/dotEmacsDir $HOME/.emacs.d

