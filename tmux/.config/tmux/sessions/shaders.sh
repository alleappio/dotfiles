#!/bin/bash

SESSION_NAME="shaders"
cd ~/Projects/shaders
tmux new-session -d -s $SESSION_NAME
tmux send-keys -t $SESSION_NAME:1 "nvim" C-m
tmux new-window -t $SESSION_NAME:2 -n 'test'
tmux new-window -t $SESSION_NAME:3 -n 'generic'
tmux split-window -t $SESSION_NAME:2 -h
tmux switch-client -t $SESSION_NAME:1
