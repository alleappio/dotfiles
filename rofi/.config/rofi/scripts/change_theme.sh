themes_location="$HOME/dotfiles/theme_gen/outputs";
options=($(ls $themes_location));

rofi_cmd() {
	rofi -theme ~/.config/rofi/generic_list/theme.rasi \
                -p "Themes" \
		-config ~/.config/rofi/config.rasi \
		-dmenu
}

choice=$(printf '%s\n' "${options[@]}"|rofi_cmd );
echo $choice

~/dotfiles/theme_gen/apply_theme.sh $choice
