#!/bin/bash

rofi_cmd() {
	rofi -theme ~/.config/rofi/powermenu/theme.rasi \
		-config ~/.config/rofi/config.rasi \
		-dmenu
}

items="⏻ Poweroff\n Reboot\n󰗽 Logout"
output=$(echo -e $items|rofi_cmd)

if [[ $output == "⏻ Poweroff" ]];then
    poweroff
elif [[ $output == " Reboot" ]];then
    systemctl reboot
elif [[ $output == "󰗽 Logout" ]];then
    hyprctl dispatch 'hl.dsp.exit()'
    swaymsg exit
else
    echo "exit"
fi
