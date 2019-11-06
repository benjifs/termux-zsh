#!/bin/sh

TERMUXZSH="https://github.com/benjifs/termux-zsh/raw/master"

echo " _                                             _     "
echo "| |_ ___ _ __ _ __ ___  _   ___  __    _______| |__  "
echo "| __/ _ \ '__| '_ \` _ \| | | \ \/ /___|_  / __| '_ \ "
echo "| ||  __/ |  | | | | | | |_| |>  <_____/ /\__ \ | | |"
echo " \__\___|_|  |_| |_| |_|\__,_/_/\_\   /___|___/_| |_|"
echo

echo "⇒ Upgrade packages"
pkg upgrade
echo "⇒ Installing packages"
pkg install zsh git openssh curl tmux vim

if [ -d "$HOME/.termux" ]; then
	echo "⇒ Backup .termux directory"
	mv $HOME/.termux $HOME/.termux.bak
fi

echo "⇒ Downloading .termux files"
curl -fsLo $HOME/.termux/colors.properties --create-dirs $TERMUXZSH/.termux/colors.properties
curl -fsLo $HOME/.termux/font.otf --create-dirs $TERMUXZSH/.termux/font.otf

echo "⇒ Downloading template .zshrc"
curl -fsLo $HOME/.zshrc $TERMUXZSH/.zshrc

echo "⇒ Set zsh as default shell"
chsh -s zsh

termux-setup-storage

echo "Setup is complete. Restart termux."

exit
