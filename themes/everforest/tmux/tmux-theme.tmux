set -g @everforest_black "#272e33"
set -g @everforest_blue "#7fbbb3"
set -g @everforest_yellow "#e5c07b"
set -g @everforest_red "#e67e80"
set -g @everforest_white "#d3c6aa"
set -g @everforest_green "#a7c080"
set -g @everforest_visual_grey "#7a8478"
set -g @everforest_comment_grey "#859289"

set-option -g status "on"

# default statusbar color
set-option -g status-style bg='#{@everforest_black}',fg='#{@everforest_white}' # bg=bg1, fg=fg1

# default window title colors
set-window-option -g window-status-style bg='#{@everforest_white}',fg='#{@everforest_black}' # bg=yellow, fg=bg1

# default window with an activity alert
set-window-option -g window-status-activity-style bg='#{@everforest_black}',fg='#{@everforest_white}' # bg=bg1, fg=fg3

# active window title colors
set-window-option -g window-status-current-style bg='#{@everforest_green}',fg='#{@everforest_black}' # fg=bg1

# pane border
set-option -g pane-active-border-style fg='#{@everforest_white}' #fg2
set-option -g pane-border-style fg='#{@everforest_black}' #bg1

# message infos
set-option -g message-style bg='#{@everforest_black}',fg='#{@everforest_white}' # bg=bg2, fg=fg1

# writing commands inactive
set-option -g message-command-style bg='#{@everforest_white}',fg='#{@everforest_black}' # bg=fg3, fg=bg1

# pane number display
set-option -g display-panes-active-colour "#aab2bf" #fg2
set-option -g display-panes-colour "#282c34" #bg1

# clock
set-window-option -g clock-mode-colour "#61afef" #blue

# bell
set-window-option -g window-status-bell-style bg='#{@everforest_green}',fg='#{@everforest_black}' # bg=green, fg=bg

## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
set-option -g status-justify "left"
set-option -g status-left-style none
set-option -g status-left-length "80"
set-option -g status-right-style none
set-option -g status-right-length "80"
set-window-option -g window-status-separator ""

set-option -g status-left "#[bg='#{@everforest_black}',fg='#{@everforest_white}'] #S #[bg='#{@everforest_black}',fg='#{@everforest_white}',nobold,noitalics,nounderscore]"
set-option -g status-right "#[bg='#{@everforest_black}',fg='#{@everforest_white}' nobold, nounderscore, noitalics]#[bg='#{@everforest_black}',fg='#{@everforest_white}'] %Y-%m-%d | %H:%M #[bg='#{@everforest_black}',fg='#{@everforest_white}',noitalics,nounderscore]#[bg='#{@everforest_white}',fg='#{@everforest_black}'] #h "

set-window-option -g window-status-current-format "#[bg='#{@everforest_white}',fg='#{@everforest_black}',nobold,noitalics,nounderscore]#[bg='#{@everforest_white}',fg='#{@everforest_black}'] #I #[bg='#{@everforest_white}',fg='#{@everforest_black}',bold] #W#{?window_zoomed_flag,*Z,} #[bg='#{@everforest_black}',fg='#{@everforest_white}',nobold,noitalics,nounderscore]"
set-window-option -g window-status-format "#[bg='#{@everforest_black}',fg='#{@everforest_white}',noitalics]#[bg='#{@everforest_black}',fg='#{@everforest_white}'] #I #[bg='#{@everforest_black}',fg='#{@everforest_white}'] #W #[bg='#{@everforest_visual_grey}',fg='#{@everforest_comment_grey}',noitalics]"

# vim: set ft=tmux tw=0 nowrap:
