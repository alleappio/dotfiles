#!/bin/bash

SESSION_NAME="uni_notes"
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? -ne 0 ]; then
    cd ~/Notes/UNIVERSITÀ/APPUNTI/MAGISTRALE/ANNO\ 2/SEMESTRE\ 1/
    tmux new-session -d -s $SESSION_NAME "nvim"
    tmux new-window -t $SESSION_NAME:2 -n 'compile'
    # tmux select-window -t $SESSION_NAME:2
    tmux split-window -t $SESSION_NAME:2 -h
    tmux split-window -t $SESSION_NAME:2 -v
    tmux send-keys -t $SESSION_NAME:2.1 "cd ~/Notes" C-m
    tmux select-layout -t $SESSION_NAME:2 tiled
    #tmux attach-session -t $SESSION_NAME
    tmux new-window -t $SESSION_NAME:3 -n 'uni_dir'
    tmux send-keys -t $SESSION_NAME:3.0 "cd ~/DATA/universita/magistrale/;clear" C-m
    # tmux select-window -t $SESSION_NAME:2
    tmux split-window -t $SESSION_NAME:3 -h
    tmux send-keys -t $SESSION_NAME:3.1 "cd ~/DATA/universita/magistrale/;clear" C-m
    tmux select-layout -t $SESSION_NAME:3 tiled
fi
tmux switch-client -t $SESSION_NAME:1
