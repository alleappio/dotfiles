#!/usr/bin/env bash
export SUDO_ASKPASS=/home/alle/.config/rofi/scripts/sudo-askpass.sh
choice=$(printf "up\ndown" | rofi -dmenu -p "vpn: ")

[[ -z $choice ]] && exit 0

sudo -A tailscale $choice
