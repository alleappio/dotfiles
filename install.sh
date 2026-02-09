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
        hyprland \
        hypridle \
        hyprlock \
        hyprpolkitagent \
        hyprland-guiutils \
        hyprlauncher \
        hyprshot \
        swaync \
        pavucontrol \
        curl \
        NetworkManager-tui \
        gnome-extensions \
        gnome-extensions-app \
        utftex \
        luarocks \
        fuzzel
elif command -v pacman &>/dev/null; then
    echo "pacman command detected, running install trough pacman"
    sudo pacman -S stow  
    sudo pacman -S fastfetch  
    sudo pacman -S neovim  
    sudo pacman -S tmux  
    sudo pacman -S kitty  
    sudo pacman -S bemenu  
    sudo pacman -S waybar  
    sudo pacman -S swaync  
    sudo pacman -S swaybg  
    sudo pacman -S hyprland  
    sudo pacman -S hypridle  
    sudo pacman -S hyprlock  
    sudo pacman -S hyprpolkitagent  
    sudo pacman -S hyprland-guiutils  
    sudo pacman -S hyprlauncher  
    sudo pacman -S hyprshot  
    sudo pacman -S swaync  
    sudo pacman -S pavucontrol  
    sudo pacman -S curl  
    sudo pacman -S NetworkManager-tui  
    sudo pacman -S gnome-extensions  
    sudo pacman -S gnome-extensions-app  
    sudo pacman -S utftex  
    sudo pacman -S luarocks
    sudo pacman -S fuzzel
    sudo pacman -S tree-sitter-cli
    sudo pacman -S nodejs
    sudo pacman -S npm
else
    echo "nor pacman and dnf detected, make sure that one of those exist and rerun this command"
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

echo "stowing hyprland"
stow hypr

echo "make flatpaks visible to bemenu"
chmod +x extract_flatpak_bins.sh
./extract_flatpak_bins.sh

echo "Select a theme"
chmod +x change_theme.sh
./change_theme.bash
