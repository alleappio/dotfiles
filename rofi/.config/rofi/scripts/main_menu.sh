#!/bin/bash

rofi_cmd() {
	rofi -theme ~/.config/rofi/generic_list/theme.rasi \
		-config ~/.config/rofi/config.rasi \
                -p ">" \
                -i \
		-dmenu
}

items=$'Launcher\nChange theme\nPassword store\npowermenu\nnmtui\nhtop\nAudio\nrmpc'

output=$(printf "%b" "$items" | rofi_cmd)

if [[ -z "$output" ]]; then
    exit 0
fi

case "$output" in
    "Change theme")
        ~/.config/rofi/scripts/change_theme.sh
        ;;
    "Launcher")
        ~/.config/rofi/scripts/launcher.sh
        ;;
    "Password store")
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
    "Audio")
        pavucontrol
        ;;
    "rmpc")
        foot -a -w 640x640 rmpc
        ;;
    *)
        exit 0
        ;;
esac
