#!/bin/bash

SESSION_NAME="uni_notes"
cd ~/Notes/UNIVERSITÀ/APPUNTI/MAGISTRALE/ANNO\ 2/SEMESTRE\ 1/
tmux new-session -d -s $SESSION_NAME "nvim"
tmux new-window -t $SESSION_NAME:2 -n 'compile'
# tmux select-window -t $SESSION_NAME:2
tmux split-window -t $SESSION_NAME:2 -h
tmux send-keys -t $SESSION_NAME:2.1 "cd ~/Notes" C-m
tmux select-layout -t $SESSION_NAME:2 tiled
#tmux attach-session -t $SESSION_NAME
tmux switch-client -t $SESSION_NAME:1
