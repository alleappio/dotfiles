#!/bin/bash

items=$'launcher\nchange theme\npassword store\npowermenu\nnmtui\nhtop\naudio\nrmpc'

output=$(printf "%b" "$items" | rofi -dmenu -p "> " -i)

if [[ -z "$output" ]]; then
    exit 0
fi

case "$output" in
    "change theme")
        ~/.config/rofi/scripts/change_theme.sh
        ;;
    "launcher")
        ~/.config/rofi/scripts/launcher.sh
        ;;
    "password store")
        ~/.config/rofi/scripts/password-store.sh
        ;;
    "powermenu")
        ~/.config/rofi/scripts/powermenu.sh
        ;;
    "htop")
        foot -a htoptui -w 640x640 htop
        ;;
    "nmtui")
        foot -a nmtui -w 640x640 nmtui
        ;;
    "audio")
        pavucontrol
        ;;
    "rmpc")
        foot -a -w 640x640 rmpc
        ;;
    *)
        exit 0
        ;;
esac
