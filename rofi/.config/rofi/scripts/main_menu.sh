#!/usr/bin/env bash

script_dir="$HOME/.config/rofi/scripts"

output=$(
    find "$script_dir" -maxdepth 1 -type f -name '*.sh' -printf '%f\n' |
        sed 's/\.sh$//' |
        rofi -dmenu -p "> " -i
)

[[ -z "$output" ]] && exit 0

"$script_dir/$output.sh"
