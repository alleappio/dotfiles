# dotfiles
My personal dotfiles, every branch is a different colorscheme

## Branches:
- gruvbox
- nordic -> default
- cattpuccin

## Install:

### Dependencies:
The packages used by this configuration are:
- fastfetch
- tmux
- kitty
- nvim
- rofi
- zsh
- oh-my-zsh
- nerd-fonts
- stow
To use hyprland as desktop environment you'll need:
- hyprland
- hyprlock
- waybar
- swaybg
To use i3 as desktop environment you'll need:
- i3-wm
- polybar
- feh
- picom

### Install:
To install all the configs:
Clone this repo:
```
git clone https://github.com/alleappio/dotfiles
cd dotfiles
```
change to the colorscheme branch that you prefer, you can choose either:
- main (nordic)
- gruvbox
- nordic
- cattpuccin
to change the branch launch:
```
git checkout gruvbox #or wathever colorscheme you prefer
```
and finally run the install script:
```
chmod +x install.sh
./install.sh
```
Done!

