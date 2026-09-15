#!/usr/bin/env bash

change_theme(){
    if [ -z "$1" ];then
        echo "no theme chosen";
        exit 1;
    fi

    clear;
    echo "Installing theme: $1";
    local theme_location="$themes_location/$1";

    echo "updating rofi...";
    cp $theme_location/rofi/global/theme.rasi $config_location/rofi/global/theme.rasi;

    echo "updating hypr...";
    cp $theme_location/hypr/theme.conf $config_location/hypr/hyprland/theme.conf;
    cp $theme_location/hypr/theme.lua $config_location/hypr/hyprland/theme.lua;

    echo "updating sway...";
    cp $theme_location/sway/theme.conf $config_location/sway/theme.conf;

    echo "updating alacritty...";
    cp $theme_location/alacritty/theme.toml $config_location/alacritty/theme.toml;

    echo "updating kitty...";
    cp $theme_location/kitty/theme.conf $config_location/kitty/theme.conf;

    echo "updating nvim...";
    cp $theme_location/neovim/theme.lua $config_location/nvim/lua/plugins/theme.lua;

    echo "updating tmux...";
    cp $theme_location/tmux/colors.conf $config_location/tmux/tmux-colors.conf;

    echo "updating wallpaper...";
    actual_file=$(ls "$HOME/dotfiles/wallpaper/$1/background_$1"*);
    echo "applying $actual_file"
    cp  "$actual_file" ~/.config/background;

    echo "updating quickshell...";
    cp $theme_location/quickshell/Theme.qml $config_location/quickshell/Theme/Theme.qml;

    echo "reload services";

    # echo "reload hyprland...";
    # hyprctl eval "reload_fn()"

    echo "reload sway...";
    swaymsg -q reload

    echo "reload alacritty...";
    touch ~/.config/alacritty/alacritty.toml
}

config_location="$HOME/.config";
themes_location="$HOME/dotfiles/theme_gen/outputs";
options=($(ls --color=never $themes_location));

choice=$1;
exists=0;

for i in ${options[@]}; do
    if [[ "$i" == "$choice" ]];then
        exists=1
    fi
done

if [[ $exists == 0 ]];then
    echo "theme not found";
    exit;
fi

change_theme $choice
