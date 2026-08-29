#!/bin/bash

SESSION_NAME="$(echo $0 | awk -F '/' '{print $(NF)}' | awk -F '.' '{print $1}')"

tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? -ne 0 ]; then
    cd ~/Projects/rmi-chat
    tmux new-session -d -s $SESSION_NAME
    tmux send-keys -t $SESSION_NAME:1 ". venv/bin/activate; nvim" C-m
    tmux new-window -t $SESSION_NAME:2 -n 'test'
    tmux new-window -t $SESSION_NAME:3 -n 'generic'
    tmux split-window -t $SESSION_NAME:2 -h
    tmux split-window -t $SESSION_NAME:2 -v
    tmux split-window -t $SESSION_NAME:2 -v
    tmux send-keys -t $SESSION_NAME:2.0 ". venv/bin/activate;clear" C-m
    tmux send-keys -t $SESSION_NAME:2.1 ". venv/bin/activate;clear" C-m
    tmux send-keys -t $SESSION_NAME:2.2 ". venv/bin/activate;clear" C-m
    tmux send-keys -t $SESSION_NAME:2.3 ". venv/bin/activate;clear" C-m
    tmux select-layout -t $SESSION_NAME:2 tiled
fi
tmux switch-client -t $SESSION_NAME:1
