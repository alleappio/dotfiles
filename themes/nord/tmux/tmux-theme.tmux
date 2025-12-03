set -g @nord_black "#2E3440"         # nord0
set -g @nord_blue "#81A1C1"          # nord10
set -g @nord_yellow "#EBCB8B"        # nord13
set -g @nord_red "#BF616A"           # nord11
set -g @nord_white "#E5E9F0"         # nord6
set -g @nord_green "#A3BE8C"         # nord14
set -g @nord_visual_grey "#4C566A"   # nord3
set -g @nord_comment_grey "#616E88"  # nord4


set-option -g status "on"

# default statusbar color
set-option -g status-style bg='#{@nord_black}',fg='#{@nord_white}' # bg=bg1, fg=fg1

# default window title colors
set-window-option -g window-status-style bg='#{@nord_white}',fg='#{@nord_black}' # bg=yellow, fg=bg1

# default window with an activity alert
set-window-option -g window-status-activity-style bg='#{@nord_black}',fg='#{@nord_white}' # bg=bg1, fg=fg3

# active window title colors
set-window-option -g window-status-current-style bg='#{@nord_green}',fg='#{@nord_black}' # fg=bg1

# pane border
set-option -g pane-active-border-style fg='#{@nord_white}' #fg2
set-option -g pane-border-style fg='#{@nord_black}' #bg1

# message infos
set-option -g message-style bg='#{@nord_black}',fg='#{@nord_white}' # bg=bg2, fg=fg1

# writing commands inactive
set-option -g message-command-style bg='#{@nord_white}',fg='#{@nord_black}' # bg=fg3, fg=bg1

# pane number display
set-option -g display-panes-active-colour "#aab2bf" #fg2
set-option -g display-panes-colour "#282c34" #bg1

# clock
set-window-option -g clock-mode-colour "#61afef" #blue

# bell
set-window-option -g window-status-bell-style bg='#{@nord_green}',fg='#{@nord_black}' # bg=green, fg=bg

## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
set-option -g status-justify "left"
set-option -g status-left-style none
set-option -g status-left-length "80"
set-option -g status-right-style none
set-option -g status-right-length "80"
set-window-option -g window-status-separator ""

set-option -g status-left "#[bg='#{@nord_black}',fg='#{@nord_white}'] #S #[bg='#{@nord_black}',fg='#{@nord_white}',nobold,noitalics,nounderscore]"
set-option -g status-right "#[bg='#{@nord_black}',fg='#{@nord_white}' nobold, nounderscore, noitalics]#[bg='#{@nord_black}',fg='#{@nord_white}'] %Y-%m-%d | %H:%M #[bg='#{@nord_black}',fg='#{@nord_white}',noitalics,nounderscore]#[bg='#{@nord_white}',fg='#{@nord_black}'] #h "

set-window-option -g window-status-current-format "#[bg='#{@nord_white}',fg='#{@nord_black}',nobold,noitalics,nounderscore]#[bg='#{@nord_white}',fg='#{@nord_black}'] #I #[bg='#{@nord_white}',fg='#{@nord_black}',bold] #W#{?window_zoomed_flag,*Z,} #[bg='#{@nord_black}',fg='#{@nord_white}',nobold,noitalics,nounderscore]"
set-window-option -g window-status-format "#[bg='#{@nord_black}',fg='#{@nord_white}',noitalics]#[bg='#{@nord_black}',fg='#{@nord_white}'] #I #[bg='#{@nord_black}',fg='#{@nord_white}'] #W #[bg='#{@nord_visual_grey}',fg='#{@nord_comment_grey}',noitalics]"

# vim: set ft=tmux tw=0 nowrap:
