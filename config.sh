#!/bin/bash

for d in ~/dotfiles/.config/*; do
	ln -sv $d ~/.config/
done

for d in ~/dotfiles/.cache/*; do
	ln -sv $d ~/.cache/
done

for d in ~/dotfiles/.themes/*; do
	ln -sv $d ~/.themes/
done

mkdir ~/.cache/bspwm
mkdir ~/.cache/bspwm/logs

# Special case for vim, because it lives outside ~/.config
ln -sv ~/dotfiles/.vim/ ~/
ln -sv ~/dotfiles/.vimrc ~/

# Special case for Xresources
ln -sv ~/dotfiles/Xresources ~/.Xresources

# Special case for dircolors
ln -sv ~/dotfiles/.dircolors ~/.dircolors

cp -Rv ~/dotfiles/.fonts/* ~/.fonts/
fc-cache -fv
