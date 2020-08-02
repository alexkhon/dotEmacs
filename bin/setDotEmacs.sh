#!/bin/bash


echo "----------------------------------------------------"
echo "Themes"
echo "----------------------------------------------------"
if [[ ! -d $HOME/Config/dotEmacs/dotEmacsDir/themes ]]
then
    mkdir -p $HOME/Config/dotEmacs/dotEmacsDir/themes
fi

if [[ ! -d $HOME/Config/dotEmacs/dotEmacsDir/themes/nord-emacs ]]
then
    pushd $HOME/Config/dotEmacs/dotEmacsDir/themes
    git clone https://github.com/arcticicestudio/nord-emacs.git
    popd
fi


echo "----------------------------------------------------"
echo "Experimental"
echo "----------------------------------------------------"
if [[ ! -d $HOME/Config/dotEmacs/dotEmacsDir/experimental ]]
then
    mkdir -p $HOME/Config/dotEmacs/dotEmacsDir/themes
fi

echo "emacs-surround -------------------------------------"
if [[ ! -d $HOME/Config/dotEmacs/dotEmacsDir/experimental/emacs-surround ]]
then
    pushd $HOME/Config/dotEmacs/dotEmacsDir/experimental
    git clone https://github.com/ganmacs/emacs-surround
    popd
fi

echo "sr-speedbar  ---------------------------------------"
if [[ ! -d $HOME/Config/dotEmacs/dotEmacsDir/experimental/sr-speedbar ]]
then
    pushd $HOME/Config/dotEmacs/dotEmacsDir/experimental
    mkdir sr-speedbar
    cd sr-speedbar
    wget https://www.emacswiki.org/emacs/download/sr-speedbar.el
    popd
fi



rm -rf $HOME/.emacs
ln -s $HOME/Config/dotEmacs/dotEmacs-defaultKeyBind.el $HOME/.emacs

rm -rf $HOME/.emacs.d
ln -s $HOME/Config/dotEmacs/dotEmacsDir $HOME/.emacs.d

