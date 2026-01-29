#!/bin/bash
set -g @gruvbox_black "#282828"
set -g @gruvbox_blue "#7daea3"
set -g @gruvbox_yellow "#d8a657"
set -g @gruvbox_red "#ea6962"
set -g @gruvbox_white "#d4Be98"
set -g @gruvbox_green "#a9b665"
set -g @gruvbox_visual_grey "#282828"
set -g @gruvbox_comment_grey "#504945"

set-option -g status "on"

# default statusbar color
set-option -g status-style bg='#{@gruvbox_black}',fg='#{@gruvbox_white}' # bg=bg1, fg=fg1

# default window title colors
set-window-option -g window-status-style bg='#{@gruvbox_white}',fg='#{@gruvbox_black}' # bg=yellow, fg=bg1

# default window with an activity alert
set-window-option -g window-status-activity-style bg='#{@gruvbox_black}',fg='#{@gruvbox_white}' # bg=bg1, fg=fg3

# active window title colors
set-window-option -g window-status-current-style bg='#{@gruvbox_blue}',fg='#{@gruvbox_black}' # fg=bg1

# pane border
set-option -g pane-active-border-style fg='#{@gruvbox_white}' #fg2
set-option -g pane-border-style fg='#{@gruvbox_black}' #bg1

# message infos
set-option -g message-style bg='#{@gruvbox_black}',fg='#{@gruvbox_white}' # bg=bg2, fg=fg1

# writing commands inactive
set-option -g message-command-style bg='#{@gruvbox_white}',fg='#{@gruvbox_black}' # bg=fg3, fg=bg1

# pane number display
set-option -g display-panes-active-colour "#aab2bf" #fg2
set-option -g display-panes-colour "#282c34" #bg1

# clock
set-window-option -g clock-mode-colour "#61afef" #blue

# bell
set-window-option -g window-status-bell-style bg='#{@gruvbox_blue}',fg='#{@gruvbox_black}' # bg=blue, fg=bg

## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
set-option -g status-justify "left"
set-option -g status-left-style none
set-option -g status-left-length "80"
set-option -g status-right-style none
set-option -g status-right-length "80"
set-window-option -g window-status-separator ""

set-option -g status-left "#[bg='#{@gruvbox_black}',fg='#{@gruvbox_white}'] #S #[bg='#{@gruvbox_black}',fg='#{@gruvbox_white}',nobold,noitalics,nounderscore]"
set-option -g status-right "#[bg='#{@gruvbox_black}',fg='#{@gruvbox_white}' nobold, nounderscore, noitalics]#[bg='#{@gruvbox_black}',fg='#{@gruvbox_white}'] %Y-%m-%d | %H:%M #[bg='#{@gruvbox_black}',fg='#{@gruvbox_white}',noitalics,nounderscore]#[bg='#{@gruvbox_white}',fg='#{@gruvbox_black}'] #h "

set-window-option -g window-status-current-format "#[bg='#{@gruvbox_white}',fg='#{@gruvbox_black}',nobold,noitalics,nounderscore]#[bg='#{@gruvbox_white}',fg='#{@gruvbox_black}'] #I #[bg='#{@gruvbox_white}',fg='#{@gruvbox_black}',bold] #W#{?window_zoomed_flag,*Z,} #[bg='#{@gruvbox_black}',fg='#{@gruvbox_white}',nobold,noitalics,nounderscore]"
set-window-option -g window-status-format "#[bg='#{@gruvbox_black}',fg='#{@gruvbox_white}',noitalics]#[bg='#{@gruvbox_black}',fg='#{@gruvbox_white}'] #I #[bg='#{@gruvbox_black}',fg='#{@gruvbox_white}'] #W #[bg='#{@gruvbox_visual_grey}',fg='#{@gruvbox_comment_grey}',noitalics]"

# vim: set ft=tmux tw=0 nowrap:
