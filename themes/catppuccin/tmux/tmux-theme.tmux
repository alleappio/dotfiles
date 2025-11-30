set -g @catppuccin_black "#1e1e2e"
set -g @catppuccin_blue "#89b4fa"
set -g @catppuccin_yellow "#f9e2af"
set -g @catppuccin_red "#f38ba8"
set -g @catppuccin_white "#cdd6f4"
set -g @catppuccin_green "#a6e3a1"
set -g @catppuccin_visual_grey "#313244"
set -g @catppuccin_comment_grey "#6c7086"

set-option -g status "on"

# default statusbar color
set-option -g status-style bg='#{@catppuccin_black}',fg='#{@catppuccin_white}' # bg=bg1, fg=fg1

# default window title colors
set-window-option -g window-status-style bg='#{@catppuccin_white}',fg='#{@catppuccin_black}' # bg=yellow, fg=bg1

# default window with an activity alert
set-window-option -g window-status-activity-style bg='#{@catppuccin_black}',fg='#{@catppuccin_white}' # bg=bg1, fg=fg3

# active window title colors
set-window-option -g window-status-current-style bg='#{@catppuccin_green}',fg='#{@catppuccin_black}' # fg=bg1

# pane border
set-option -g pane-active-border-style fg='#{@catppuccin_white}' #fg2
set-option -g pane-border-style fg='#{@catppuccin_black}' #bg1

# message infos
set-option -g message-style bg='#{@catppuccin_black}',fg='#{@catppuccin_white}' # bg=bg2, fg=fg1

# writing commands inactive
set-option -g message-command-style bg='#{@catppuccin_white}',fg='#{@catppuccin_black}' # bg=fg3, fg=bg1

# pane number display
set-option -g display-panes-active-colour "#aab2bf" #fg2
set-option -g display-panes-colour "#282c34" #bg1

# clock
set-window-option -g clock-mode-colour "#61afef" #blue

# bell
set-window-option -g window-status-bell-style bg='#{@catppuccin_green}',fg='#{@catppuccin_black}' # bg=green, fg=bg

## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
set-option -g status-justify "left"
set-option -g status-left-style none
set-option -g status-left-length "80"
set-option -g status-right-style none
set-option -g status-right-length "80"
set-window-option -g window-status-separator ""

set-option -g status-left "#[bg='#{@catppuccin_black}',fg='#{@catppuccin_white}'] #S #[bg='#{@catppuccin_black}',fg='#{@catppuccin_white}',nobold,noitalics,nounderscore]"
set-option -g status-right "#[bg='#{@catppuccin_black}',fg='#{@catppuccin_white}' nobold, nounderscore, noitalics]#[bg='#{@catppuccin_black}',fg='#{@catppuccin_white}'] %Y-%m-%d | %H:%M #[bg='#{@catppuccin_black}',fg='#{@catppuccin_white}',noitalics,nounderscore]#[bg='#{@catppuccin_white}',fg='#{@catppuccin_black}'] #h "

set-window-option -g window-status-current-format "#[bg='#{@catppuccin_white}',fg='#{@catppuccin_black}',nobold,noitalics,nounderscore]#[bg='#{@catppuccin_white}',fg='#{@catppuccin_black}'] #I #[bg='#{@catppuccin_white}',fg='#{@catppuccin_black}',bold] #W#{?window_zoomed_flag,*Z,} #[bg='#{@catppuccin_black}',fg='#{@catppuccin_white}',nobold,noitalics,nounderscore]"
set-window-option -g window-status-format "#[bg='#{@catppuccin_black}',fg='#{@catppuccin_white}',noitalics]#[bg='#{@catppuccin_black}',fg='#{@catppuccin_white}'] #I #[bg='#{@catppuccin_black}',fg='#{@catppuccin_white}'] #W #[bg='#{@catppuccin_visual_grey}',fg='#{@catppuccin_comment_grey}',noitalics]"

# vim: set ft=tmux tw=0 nowrap:
