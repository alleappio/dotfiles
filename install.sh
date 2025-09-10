#!/bin/bash

echo "enabling solopasha/hyprland copr"
sudo dnf copr enable solopasha/hyprland

echo "installing required packages"
sudo dnf install -y stow \
  zsh \
  fastfetch \
  neovim \
  tmux \
  kitty \
  bemenu \
  waybar \
  swaync \
  swaybg \
  hyprland \
  swaync \
  hypridle \
  hyprlock \
  slurp \
  grim \
  xclip \
  pavucontrol \
  curl

echo "installing oh-my-zsh, please follow the instructions provided by its installer"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "copying zsh files"
cp zsh/.zshrc ~
cp -r zsh/.oh-my-zsh/custom/plugins/* ~/.oh-my-zsh/custom/plugins
cp -r zsh/.oh-my-zsh/custom/themes/* ~/.oh-my-zsh/custom/themes

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
cp wallpaper/.config/background ~/.config/background

echo "stowing hypr"
stow hypr

echo "make flatpaks visible to bemenu"
chmod +x extract_flatpak_bins.sh
./extract_flatpak_bins.sh
