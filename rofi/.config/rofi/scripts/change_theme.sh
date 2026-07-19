themes_location="$HOME/dotfiles/themes";
options=($(ls $themes_location));

rofi_cmd() {
	rofi -theme ~/.config/rofi/generic_list/theme.rasi \
                -p "Themes" \
		-config ~/.config/rofi/config.rasi \
		-dmenu
}

choice=$(printf '%s\n' "${options[@]}"|rofi_cmd );
echo $choice

~/dotfiles/scripts/select_theme.sh $choice
