#!/bin/bash

SESSION_NAME="iot_project"
cd ~/DATA/universita/magistrale/anno2/semestre1/iot/progetto
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? -ne 0 ]; then
    tmux new-session -d -s $SESSION_NAME
    tmux send-keys -t $SESSION_NAME:1 "nvim" C-m
    tmux new-window -t $SESSION_NAME:2 -n 'test'
    tmux new-window -t $SESSION_NAME:3 -n 'generic'
    tmux split-window -t $SESSION_NAME:2 -h
fi
tmux switch-client -t $SESSION_NAME:1
