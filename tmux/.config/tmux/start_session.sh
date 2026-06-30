#!/bin/bash

SESSIONS_PATH=~/.config/tmux/sessions 
fzf_command() {
    fzf --style=full --color='fg:white,pointer:blue,current-fg:white' --layout=reverse --border=sharp
}

choice=$(ls --color=never $SESSIONS_PATH | fzf_command)

if [ -z "$choice" ]; then
    exit 0
fi

bash "$SESSIONS_PATH/$choice"
