set -g @kanagawa_black "#1f1f28"         # sumiInk0
set -g @kanagawa_blue "#7E9CD8"          # fujiBlue
set -g @kanagawa_yellow "#C0A36E"        # autumnYellow
set -g @kanagawa_red "#C34043"           # samuraiRed
set -g @kanagawa_white "#dcd7ba"         # fujiWhite
set -g @kanagawa_green "#76946a"         # springGreen
set -g @kanagawa_visual_grey "#2a2a37"   # waveBlue1
set -g @kanagawa_comment_grey "#727169"  # oldWhite


set-option -g status "on"

# default statusbar color
set-option -g status-style bg='#{@kanagawa_black}',fg='#{@kanagawa_white}' # bg=bg1, fg=fg1

# default window title colors
set-window-option -g window-status-style bg='#{@kanagawa_white}',fg='#{@kanagawa_black}' # bg=yellow, fg=bg1

# default window with an activity alert
set-window-option -g window-status-activity-style bg='#{@kanagawa_black}',fg='#{@kanagawa_white}' # bg=bg1, fg=fg3

# active window title colors
set-window-option -g window-status-current-style bg='#{@kanagawa_green}',fg='#{@kanagawa_black}' # fg=bg1

# pane border
set-option -g pane-active-border-style fg='#{@kanagawa_white}' #fg2
set-option -g pane-border-style fg='#{@kanagawa_black}' #bg1

# message infos
set-option -g message-style bg='#{@kanagawa_black}',fg='#{@kanagawa_white}' # bg=bg2, fg=fg1

# writing commands inactive
set-option -g message-command-style bg='#{@kanagawa_white}',fg='#{@kanagawa_black}' # bg=fg3, fg=bg1

# pane number display
set-option -g display-panes-active-colour "#aab2bf" #fg2
set-option -g display-panes-colour "#282c34" #bg1

# clock
set-window-option -g clock-mode-colour "#61afef" #blue

# bell
set-window-option -g window-status-bell-style bg='#{@kanagawa_green}',fg='#{@kanagawa_black}' # bg=green, fg=bg

## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
set-option -g status-justify "left"
set-option -g status-left-style none
set-option -g status-left-length "80"
set-option -g status-right-style none
set-option -g status-right-length "80"
set-window-option -g window-status-separator ""

set-option -g status-left "#[bg='#{@kanagawa_black}',fg='#{@kanagawa_white}'] #S #[bg='#{@kanagawa_black}',fg='#{@kanagawa_white}',nobold,noitalics,nounderscore]"
set-option -g status-right "#[bg='#{@kanagawa_black}',fg='#{@kanagawa_white}' nobold, nounderscore, noitalics]#[bg='#{@kanagawa_black}',fg='#{@kanagawa_white}'] %Y-%m-%d | %H:%M #[bg='#{@kanagawa_black}',fg='#{@kanagawa_white}',noitalics,nounderscore]#[bg='#{@kanagawa_white}',fg='#{@kanagawa_black}'] #h "

set-window-option -g window-status-current-format "#[bg='#{@kanagawa_white}',fg='#{@kanagawa_black}',nobold,noitalics,nounderscore]#[bg='#{@kanagawa_white}',fg='#{@kanagawa_black}'] #I #[bg='#{@kanagawa_white}',fg='#{@kanagawa_black}',bold] #W#{?window_zoomed_flag,*Z,} #[bg='#{@kanagawa_black}',fg='#{@kanagawa_white}',nobold,noitalics,nounderscore]"
set-window-option -g window-status-format "#[bg='#{@kanagawa_black}',fg='#{@kanagawa_white}',noitalics]#[bg='#{@kanagawa_black}',fg='#{@kanagawa_white}'] #I #[bg='#{@kanagawa_black}',fg='#{@kanagawa_white}'] #W #[bg='#{@kanagawa_visual_grey}',fg='#{@kanagawa_comment_grey}',noitalics]"

# vim: set ft=tmux tw=0 nowrap:
