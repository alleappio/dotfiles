items="⏻ Poweroff\n Reboot\n󰗽 Logout"
output=$(echo -e $items|walker --dmenu -H -n -N --minheight 1)

if [[ $output == "⏻ Poweroff" ]];then
    poweroff
elif [[ $output == " Reboot" ]];then
    reboot now
elif [[ $output == "󰗽 Logout" ]];then
    hyprctl dispatch exit
else
    echo "exit"
fi
