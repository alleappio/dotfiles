#!/bin/bash

git submodule update --init

echo "installing required packages"
yay -S --needed $(cat arch_pkglist.txt)

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

echo "stowing kitty"
stow kitty

echo "stowing waybar"
stow waybar

echo "stowing swaync"
stow swaync

echo "stowing hyprland"
stow hypr

echo "stowing rofi"
stow rofi

echo "Select a theme"
chmod +x change_theme.sh
./change_theme.bash
