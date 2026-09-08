#!/bin/bash

SESSIONS_PATH=~/.config/kitty/sessions
fzf_command() {
    fzf --color='fg:white,pointer:blue,current-fg:white' --layout=reverse
}

choice=$(ls --color=never $SESSIONS_PATH | fzf_command)

if [ -z "$choice" ]; then
    exit 0
fi

kitten @ action goto_session $SESSIONS_PATH/$choice
