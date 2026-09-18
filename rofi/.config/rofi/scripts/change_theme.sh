themes_location="$HOME/dotfiles/theme_gen/themes";
options=($(ls $themes_location));

# choice=$(printf '%s\n' "${options[@]}"|rofi -dmenu -p "> " -i);
choice=$(printf '%s\n' "${options[@]%.toml}" | rofi -dmenu -p "> " -i)
[[ -z "$choice" ]] && exit 0
echo $choice

~/dotfiles/theme_gen/theme_generator.py $choice
~/dotfiles/theme_gen/apply_theme.sh $choice
