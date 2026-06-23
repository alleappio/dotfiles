#!/bin/bash

SESSION_NAME="home"

tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION_NAME
fi

if [ -n "$TMUX" ]; then
    tmux switch-client -t $SESSION_NAME
else
    tmux attach-session -t $SESSION_NAME
fi
