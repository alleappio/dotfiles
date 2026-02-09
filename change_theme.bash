#options=("option1" "option2" "option3" "Quit")
BLUE="$(tput bold; tput setaf 4)"
GREEN="$(tput bold; tput setaf 2)"
YELLOW="$(tput sgr0; tput setaf 3)"
RED="$(tput sgr0; tput setaf 1)"
RESET="$(tput sgr0)"
dotfiles_location="$HOME/dotfiles";
themes_location="$HOME/dotfiles/themes";
options=($(ls $themes_location));
selection=0;
options+=("quit");
options_length=$(( ${#options[@]}-1 ));
flag=1;

cleanup() {
    tput cnorm
}

display() {
    clear;
    echo "Please choose an option:";
    for i in ${!options[@]}; do
        if [ $i -eq $1 ]; then
            printf "${GREEN}> ${RESET}" 
        else
            printf " "
        fi;
        printf "${options[$i]}\n";
    done;
}

change_theme(){
    clear;
    echo "Installing theme: ${options[$1]}";
    local theme_location=$themes_location/${options[$1]};
    
    echo "updating bemenu...";
    ln -fs $theme_location/bemenu/colors.sh $dotfiles_location/bemenu/.config/bemenu/colors.sh;

    echo "updating fuzzel...";
    ln -fs $theme_location/fuzzel/colors.ini $dotfiles_location/fuzzel/.config/fuzzel/colors.ini;

    echo "updating sway...";
    ln -fs $theme_location/sway/colors.conf $dotfiles_location/sway/.config/sway/colors.conf;

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
    ln -fs $theme_location/wallpaper/background $dotfiles_location/wallpaper/.config/background;
    ln -fs $theme_location/wallpaper/blurred_background $dotfiles_location/wallpaper/.config/blurred_background;

    echo "updating waybar...";
    ln -fs $theme_location/waybar/colors.css $dotfiles_location/waybar/.config/waybar/colors.css;

    echo "reload services";

    echo "reload hyprland...";
    hyprctl reload;

    echo "relaod waybar...";
    pkill waybar;
    hyprctl dispatch exec waybar;

    echo "reload swaybg...";
    pkill swaybg; hyprctl dispatch exec "swaybg -i ~/.config/background";

    echo "reload swaync...";
    pkill swaync; hyprctl dispatch exec swaync;

    echo "Press any key to continue...";
    read -rsn1;
}

trap cleanup EXIT
tput civis
while [ $flag -ne 0 ]; do
    display $selection;
    read -rsn1 input;
    if [[ $input == $'\x1b' ]]; then
        read -rsn2 input;
        if [[ $input == "[A" ]]; then
            ((selection--));
            if [ $selection -lt 0 ]; then
                selection=$options_length;
            fi;
        elif [[ $input == "[B" ]]; then
            ((selection++));
            if [ $selection -gt $options_length ]; then
                selection=0;
            fi;
        fi;
    elif [[ $input = "" ]]; then
        if [ $selection -eq $options_length ]; then
            printf "Bye bye!\n";
            flag=0;
        else
            change_theme $selection;
            flag=0;
        fi;
    fi;
done
