options=($(ls /home/alle/dotfiles));

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "> " -i)
[[ -z "$choice" ]] && exit 0
echo $choice

foot nvim /home/alle/dotfiles/$choice/.config/$choice
