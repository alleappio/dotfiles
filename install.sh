#!/bin/bash

git submodule update --init

echo "installing required packages"
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
