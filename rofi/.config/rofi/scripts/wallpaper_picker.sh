#!/bin/bash

change_wallpaper(){
    ln -fs $1 ~/.config/background;
    pkill hyprpaper; hyprctl dispatch exec "hyprpaper";
}

rofi_command(){
    export PREVIEW=true
    rofi -theme ~/.config/rofi/wallpaper_picker/theme.rasi \
            -show filebrowser \
            -filebrowser-directory ~/dotfiles/wallpaper \
            -filebrowser-command echo
}

new_wallpaper=$(rofi_command);

if [[ $new_wallpaper != "" ]];then
    change_wallpaper $new_wallpaper;
fi
