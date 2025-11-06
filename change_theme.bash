#options=("option1" "option2" "option3" "Quit")
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
            printf ">" 
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
    cp $theme_location/bemenu/colors.sh $dotfiles_location/bemenu/.config/bemenu;

    echo "updating hypr...";
    cp $theme_location/hypr/colors.conf $dotfiles_location/hypr/.config/hypr;

    echo "updating kitty...";
    cp $theme_location/kitty/colors.conf $dotfiles_location/kitty/.config/kitty;

    echo "updating nvim...";
    cp $theme_location/nvim/theme.lua $dotfiles_location/nvim/.config/nvim/lua/plugins;
    cp $theme_location/nvim/vim-theme-options.lua $dotfiles_location/nvim/.config/nvim/lua;

    echo "updating swaync...";
    cp $theme_location/swaync/colors.css $dotfiles_location/swaync/.config/swaync;

    echo "updating terminator...";
    cp $theme_location/terminator/config $dotfiles_location/terminator/.config/terminator;

    echo "updating tmux...";
    cp $theme_location/tmux/tmux-theme.tmux $dotfiles_location/tmux/.config/tmux;

    echo "updating wallpaper...";
    cp $theme_location/wallpaper/background $dotfiles_location/wallpaper/.config/;

    echo "updating waybar...";
    cp $theme_location/waybar/colors.css $dotfiles_location/waybar/.config/waybar/;

    echo "reload services";

    echo "reload hyprland...";
    hyprctl reload;

    echo "relaod waybar...";
    pkill waybar;
    hyprctl dispatch exec waybar;

    echo "reload swaybg...";
    hyprctl dispatch exec "swaybg -i ~/.config/background";

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
        fi;
    fi;
done
