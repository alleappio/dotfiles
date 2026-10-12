#!/usr/bin/env bash

items=$'play-pause\nnext\nprevious'

output=$(printf "%b" "$items" | rofi -dmenu -p "player: " -i)

[[ -z "$output" ]] && exit 0

playerctl $output
