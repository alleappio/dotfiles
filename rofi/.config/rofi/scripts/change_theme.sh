dotfiles_location="$HOME/dotfiles";
themes_location="$HOME/dotfiles/themes";
options=($(ls $themes_location));


change_theme(){
    if [ -z "$1" ];then
        echo "no theme chosen";
        exit 1;
    fi

    clear;
    echo "Installing theme: $1";
    local theme_location="$themes_location/$1";
    echo "updating rofi...";
    ln -fs $theme_location/rofi/colors.rasi $dotfiles_location/rofi/.config/rofi/colors.rasi;

    echo "updating hypr...";
    ln -fs $theme_location/hypr/colors.conf $dotfiles_location/hypr/.config/hypr/colors.conf;

    echo "updating kitty...";
    ln -fs $theme_location/kitty/colors.conf $dotfiles_location/kitty/.config/kitty/colors.conf;

    echo "updating nvim...";
    ln -fs $theme_location/nvim/theme.lua $dotfiles_location/nvim/.config/nvim/lua/plugins/theme.lua;
    ln -fs $theme_location/nvim/vim-theme-options.lua $dotfiles_location/nvim/.config/nvim/lua/vim-theme-options.lua;

    echo "updating swaync...";
    ln -fs $theme_location/swaync/colors.css $dotfiles_location/swaync/.config/swaync/colors.css;

    echo "updating tmux...";
    ln -fs $theme_location/tmux/tmux-theme.tmux $dotfiles_location/tmux/.config/tmux/tmux-theme.tmux;

    echo "updating wallpaper...";
    ln -fs $theme_location/wallpaper/background ~/.config/background;

    echo "updating waybar...";
    ln -fs $theme_location/waybar/colors.css $dotfiles_location/waybar/.config/waybar/colors.css;

    echo "reload services";

    echo "reload hyprland...";
    hyprctl reload;

    echo "relaod waybar...";
    pkill waybar;
    hyprctl dispatch exec waybar;

    echo "reload hyprpaper...";
    pkill hyprpaper; hyprctl dispatch exec "hyprpaper";

    echo "reload swaync...";
    pkill swaync; hyprctl dispatch exec swaync;
}

rofi_cmd() {
	rofi -theme ~/.config/rofi/generic_list/theme.rasi \
		-config ~/.config/rofi/config.rasi \
		-dmenu
}

choice=$(printf '%s\n' "${options[@]}"|rofi_cmd );
echo $choice

change_theme $choice
