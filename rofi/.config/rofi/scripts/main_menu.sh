#!/bin/bash

rofi_cmd() {
	rofi -theme ~/.config/rofi/generic_list/theme.rasi \
		-config ~/.config/rofi/config.rasi \
                -p ">" \
                -i \
		-dmenu
}

items=$'Launcher\nChange theme\nPassword store\npowermenu\nnmtui\nhtop\nAudio'

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
        alacritty --class htoptui -e htop
        ;;
    "nmtui")
        alacritty --class nmtui -e nmtui
        ;;
    "Audio")
        pavucontrol-qt
        ;;
    *)
        exit 0
        ;;
esac
