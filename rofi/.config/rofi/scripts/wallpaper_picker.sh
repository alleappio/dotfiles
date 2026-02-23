#!/bin/bash

export PREVIEW=true
rofi -theme ~/.config/rofi/wallpaper_picker/theme.rasi \
        -show filebrowser \
        -filebrowser-directory ~/dotfiles/wallpaper
