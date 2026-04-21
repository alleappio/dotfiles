
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
    ln -fs $theme_location/hypr/colors.conf $dotfiles_location/hypr/.config/hypr/hyprland/colors.conf;

    echo "updating kitty...";
    ln -fs $theme_location/kitty/colors.conf $dotfiles_location/kitty/.config/kitty/colors.conf;

    echo "updating alacritty...";
    ln -fs $theme_location/alacritty/theme.toml $dotfiles_location/alacritty/.config/alacritty/theme.toml;

    echo "updating nvim...";
    ln -fs $theme_location/nvim/theme.lua $dotfiles_location/nvim/.config/nvim/lua/plugins/theme.lua;
#    ln -fs $theme_location/nvim/vim-theme-options.lua $dotfiles_location/nvim/.config/nvim/lua/vim-theme-options.lua;

    echo "updating swaync...";
    ln -fs $theme_location/swaync/colors.css $dotfiles_location/swaync/.config/swaync/colors.css;

    echo "updating tmux...";
    ln -fs $theme_location/tmux/tmux-colors.conf $dotfiles_location/tmux/.config/tmux/tmux-colors.conf;

    echo "updating wallpaper...";
    actual_file=$(ls "$dotfiles_location/wallpaper/$1/background_$1"*); 
    ln -fs "$actual_file" ~/.config/background;

    echo "updating waybar...";
    ln -fs $theme_location/waybar/colors.css $dotfiles_location/waybar/.config/waybar/colors.css;

    echo "updating plasma...";
    if [[ ! -e "$HOME/.local/share/color-schemes/$1.colors" ]];then
         ~/dotfiles/plasma/plasma_colors.py $1
    fi

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

    echo "reload plasma...";
    plasma-apply-colorscheme $1

    echo "reload alacritty...";
    touch ~/.config/alacritty/alacritty.toml
}

dotfiles_location="$HOME/dotfiles";
themes_location="$HOME/dotfiles/themes";
options=($(ls $themes_location));

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
