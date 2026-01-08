# dotfiles
My personal dotfiles.

## Install:

### Dependencies:
The packages used by this configuration are:
- fastfetch
- tmux
- kitty
- nvim
- nerd-fonts
- stow
- terminator
- sway
- waybar
- swaybg
- swaync

### Install:
To install all the configs:
Clone this repo:
```bash
git clone https://github.com/alleappio/dotfiles
cd dotfiles
```
and run the install script:
```bash
chmod +x install.sh
./install.sh
```

## Change theme
To change the current theme, run the provided script
```bash
./change_theme.bash
```

Done!

## Troubleshooting
If sway doesn't start from gdm, edit `/usr/share/wayland-sessions/sway.desktop` or copy it to something like `sway-nvidia.desktop` and add the flag `--unsupported-gpu` to the `exec` field
Example:
```desktop
[Desktop Entry]
Name=Sway
Comment=An i3-compatible Wayland compositor
Exec=sway --unsupported-gpu
Type=Application
DesktopNames=sway;wlroots
```

