#!/bin/bash

git submodule update --init

echo "installing required packages"
if command -v dnf &>/dev/null; then
    echo "dnf command detected, running install trhough dnf"
    sudo dnf install -y stow \
        fastfetch \
        neovim \
        tmux \
        kitty \
        bemenu \
        waybar \
        swaync \
        swaybg \
        sway \
        swaync \
        pavucontrol \
        curl \
        NetworkManager-tui \
        gnome-extensions \
        gnome-extensions-app \
        utftex \
        luarocks \
        grimshot \
        lxpolkit
elif command -v yay &>/dev/null; then
    echo "yay command detected, running install trough yay and pacman"
    pacman -S stow  
    pacman -S fastfetch  
    pacman -S neovim  
    pacman -S tmux  
    pacman -S kitty  
    pacman -S bemenu  
    pacman -S waybar  
    pacman -S swaync  
    pacman -S swaybg  
    pacman -S sway  
    pacman -S swaync  
    pacman -S pavucontrol  
    pacman -S curl  
    pacman -S luarocks  
    yay -S grimshot  
    yay -S lxpolkit
    pacman -S tree-sitter
    pacman -S tree-sitter-cli
    pacman -S npm
    pacman -S ripgrep
else
    echo "nor yay and dnf detected, make sure that one of those exist and rerun this command"
    exit
fi

echo "stowing bash"
stow bash

echo "stowing fastfetch"
stow fastfetch

echo "stowing nvim"
stow nvim

echo "stowing tmux"
stow tmux

echo "stowing kitty"
stow kitty

echo "stowing bemenu"
stow bemenu

echo "stowing waybar"
stow waybar

echo "stowing swaync"
stow swaync

echo "copying wallpaper"
stow wallpaper

echo "stowing sway"
stow sway

echo "make flatpaks visible to bemenu"
chmod +x extract_flatpak_bins.sh
./extract_flatpak_bins.sh
