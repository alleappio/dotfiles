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
    sudo pacman -S - < arch_pkglist.txt
else
    echo "nor pacman and dnf detected, make sure that one of those exist and rerun this command"
    exit
fi

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

echo "stowing bemenu"
stow bemenu

echo "stowing fuzzel"
stow fuzzel

echo "stowing waybar"
stow waybar

echo "stowing swaync"
stow swaync

echo "copying wallpaper"
stow wallpaper

echo "stowing hyprland"
stow hypr

echo "Select a theme"
chmod +x change_theme.sh
./change_theme.bash
