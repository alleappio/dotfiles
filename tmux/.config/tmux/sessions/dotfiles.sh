#!/bin/bash

SESSION_NAME="dotfiles"
cd ~/dotfiles
tmux new-session -d -s $SESSION_NAME 
tmux send-keys -t $SESSION_NAME:1 "nvim" C-m
tmux new-window -t $SESSION_NAME:2 -n 'git'
tmux switch-client -t $SESSION_NAME:1
