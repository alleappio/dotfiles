#!/bin/bash

choice=$(find ~/.config/tmux/sessions/* | fzf --style=full --color=base16 --layout=reverse --border=sharp)

if [ -z "$choice" ]; then
    exit 0
fi

bash "$choice"
