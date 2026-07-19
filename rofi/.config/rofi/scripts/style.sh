#!/bin/bash

rofi_cmd() {
	rofi -theme ~/.config/rofi/generic_list/theme.rasi \
		-config ~/.config/rofi/config.rasi \
                -p "Style" \
		-dmenu
}

items="Change theme\nChange wallpaper"
output=$(echo -e $items|rofi_cmd)

if [[ $output == "Change theme" ]];then
    ~/.config/rofi/scripts/change_theme.sh
elif [[ $output == "Change wallpaper" ]];then
    ~/.config/rofi/scripts/wallpaper_picker.sh
else
    echo "exit"
fi
