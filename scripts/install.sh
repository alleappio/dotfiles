#!/bin/bash

DOTFILES="/home/alle/dotfiles"

git submodule update --init

echo "installing required packages"
yay -S --needed $(cat arch_pkglist.txt)

cd $DOTFILES

echo "stowing bash"
rm ~/.bashrc
if [ -d ~/.bashrc.d ]; then
    rm -r .bashrc.d
fi
stow bash

echo "stowing fastfetch"
stow fastfetch

echo "stowing nvim"
stow nvim

echo "stowing tmux"
stow tmux

echo "stowing foot"
stow foot

echo "stowing waybar"
stow waybar

echo "stowing swaync"
stow swaync

echo "stowing sway"
stow sway

echo "stowing rofi"
stow rofi
