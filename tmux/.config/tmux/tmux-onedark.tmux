#!/bin/bash
set -g @onedark_black "#282c34"
set -g @onedark_blue "#61afef"
set -g @onedark_yellow "#e5c07b"
set -g @onedark_red "#e06c75"
set -g @onedark_white "#aab2bf"
set -g @onedark_green "#98c379"
set -g @onedark_visual_grey "#3e4452"
set -g @onedark_comment_grey "#5c6370"

## COLORSCHEME: gruvbox dark (medium)
set-option -g status "on"

# default statusbar color
set-option -g status-style bg='#{@onedark_black}',fg='#{@onedark_white}' # bg=bg1, fg=fg1

# default window title colors
set-window-option -g window-status-style bg='#{@onedark_white}',fg='#{@onedark_black}' # bg=yellow, fg=bg1

# default window with an activity alert
set-window-option -g window-status-activity-style bg='#{@onedark_black}',fg='#{@onedark_white}' # bg=bg1, fg=fg3

# active window title colors
set-window-option -g window-status-current-style bg='#{@onedark_blue}',fg='#{@onedark_black}' # fg=bg1

# pane border
set-option -g pane-active-border-style fg='#{@onedark_white}' #fg2
set-option -g pane-border-style fg='#{@onedark_black}' #bg1

# message infos
set-option -g message-style bg='#{@onedark_black}',fg='#{@onedark_white}' # bg=bg2, fg=fg1

# writing commands inactive
set-option -g message-command-style bg='#{@onedark_white}',fg='#{@onedark_black}' # bg=fg3, fg=bg1

# pane number display
set-option -g display-panes-active-colour "#aab2bf" #fg2
set-option -g display-panes-colour "#282c34" #bg1

# clock
set-window-option -g clock-mode-colour "#61afef" #blue

# bell
set-window-option -g window-status-bell-style bg='#{@onedark_blue}',fg='#{@onedark_black}' # bg=blue, fg=bg

## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
set-option -g status-justify "left"
set-option -g status-left-style none
set-option -g status-left-length "80"
set-option -g status-right-style none
set-option -g status-right-length "80"
set-window-option -g window-status-separator ""

set-option -g status-left "#[bg='#{@onedark_black}',fg='#{@onedark_white}'] #S #[bg='#{@onedark_black}',fg='#{@onedark_white}',nobold,noitalics,nounderscore]"
set-option -g status-right "#[bg='#{@onedark_black}',fg='#{@onedark_white}' nobold, nounderscore, noitalics]#[bg='#{@onedark_black}',fg='#{@onedark_white}'] %Y-%m-%d | %H:%M #[bg='#{@onedark_black}',fg='#{@onedark_white}',noitalics,nounderscore]#[bg='#{@onedark_white}',fg='#{@onedark_black}'] #h "

set-window-option -g window-status-current-format "#[bg='#{@onedark_white}',fg='#{@onedark_black}',nobold,noitalics,nounderscore]#[bg='#{@onedark_white}',fg='#{@onedark_black}'] #I #[bg='#{@onedark_white}',fg='#{@onedark_black}',bold] #W#{?window_zoomed_flag,*Z,} #[bg='#{@onedark_black}',fg='#{@onedark_white}',nobold,noitalics,nounderscore]"
set-window-option -g window-status-format "#[bg='#{@onedark_black}',fg='#{@onedark_white}',noitalics]#[bg='#{@onedark_black}',fg='#{@onedark_white}'] #I #[bg='#{@onedark_black}',fg='#{@onedark_white}'] #W #[bg='#{@onedark_visual_grey}',fg='#{@onedark_comment_grey}',noitalics]"

# vim: set ft=tmux tw=0 nowrap:
