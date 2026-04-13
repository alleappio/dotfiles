#!/bin/bash

SESSION_NAME="unimore_navigator"
cd ~/DATA/f1tenth/workspace/unimore_navigator/
tmux new-session -d -s $SESSION_NAME "nvim"
tmux new-window -t $SESSION_NAME:2 -n 'distrobox'
tmux new-window -t $SESSION_NAME:3 -n 'generic'
# tmux select-window -t $SESSION_NAME:2
tmux split-window -t $SESSION_NAME:2 -h
tmux split-window -t $SESSION_NAME:2 -v
tmux split-window -t $SESSION_NAME:2 -v 
tmux send-keys -t $SESSION_NAME:2.0 "distrobox enter --root ubuntu-f1tenth" C-m
tmux send-keys -t $SESSION_NAME:2.1 "distrobox enter --root ubuntu-f1tenth" C-m
tmux send-keys -t $SESSION_NAME:2.2 "distrobox enter --root ubuntu-f1tenth" C-m
tmux send-keys -t $SESSION_NAME:2.3 "cd ~/DATA/f1tenth/f1tenth_gym_ros/" C-m
tmux select-layout -t $SESSION_NAME:2 tiled
#tmux attach-session -t $SESSION_NAME
tmux switch-client -t $SESSION_NAME:1
