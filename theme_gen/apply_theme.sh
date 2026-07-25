change_theme(){
    if [ -z "$1" ];then
        echo "no theme chosen";
        exit 1;
    fi

    clear;
    echo "Installing theme: $1";
    local theme_location="$themes_location/$1";
    echo "updating rofi...";
    cp $theme_location/rofi/colors.rasi $config_location/rofi/colors.rasi;

    echo "updating hypr...";
    cp $theme_location/hypr/colors.conf $config_location/hypr/hyprland/colors.conf;
    cp $theme_location/hypr/colors.lua $config_location/hypr/hyprland/colors.lua;

    echo "updating alacritty...";
    cp $theme_location/alacritty/theme.toml $config_location/alacritty/theme.toml;

    echo "updating nvim...";
    cp $theme_location/neovim/theme.lua $config_location/nvim/lua/plugins/theme.lua;

    echo "updating swaync...";
    cp $theme_location/swaync/colors.css $config_location/swaync/colors.css;

    echo "updating tmux...";
    cp $theme_location/tmux/colors.conf $config_location/tmux/tmux-colors.conf;

    echo "updating wallpaper...";
    actual_file=$(ls "$HOME/dotfiles/wallpaper/$1/background_$1"*);
    cp  "$actual_file" ~/.config/background;

    echo "updating waybar...";
    cp $theme_location/waybar/colors.css $config_location/waybar/colors.css;

    echo "updating plasma...";
    if [[ ! -e "$HOME/.local/share/color-schemes/$1.colors" ]];then
         cp $HOME/dotfiles/theme_gen/outputs/$1/plasma.colors $HOME/.local/share/color-schemes/$1.colors
    fi

    echo "reload services";

    echo "reload hyprland...";
    hyprctl eval "reload_fn()"

    echo "reload plasma...";
    plasma-apply-colorscheme $1

    echo "reload alacritty...";
    touch ~/.config/alacritty/alacritty.toml
}

config_location="$HOME/.config";
themes_location="outputs";
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
