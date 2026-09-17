#!/bin/bash

rofi_cmd() {
	rofi -theme ~/.config/rofi/powermenu/theme.rasi \
		-config ~/.config/rofi/config.rasi \
		-dmenu
}

items="poweroff\nreboot\nlogout"
output=$(echo -e $items|rofi -dmenu -i -p "> ")

if [[ $output == "poweroff" ]];then
    poweroff
elif [[ $output == "reboot" ]];then
    systemctl reboot
elif [[ $output == "logout" ]];then
    hyprctl dispatch 'hl.dsp.exit()'
    swaymsg exit
else
    echo "exit"
fi
