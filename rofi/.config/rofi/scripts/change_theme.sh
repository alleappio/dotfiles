themes_location="$HOME/dotfiles/theme_gen/outputs";
options=($(ls $themes_location));

choice=$(printf '%s\n' "${options[@]}"|rofi -dmenu -p "> " -i);
echo $choice

~/dotfiles/theme_gen/theme_generator.py $choice
~/dotfiles/theme_gen/apply_theme.sh $choice
