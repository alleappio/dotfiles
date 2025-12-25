set -g @tokyonight_black "#1a1b26"
set -g @tokyonight_blue "#7aa2f7"
set -g @tokyonight_yellow "#e0af68"
set -g @tokyonight_red "#f7768e"
set -g @tokyonight_white "#c0caf5"
set -g @tokyonight_green "#9ece6a"
set -g @tokyonight_visual_grey "#3b4261"
set -g @tokyonight_comment_grey "#565f89"

## COLORSCHEME: gruvbox dark (medium)
set-option -g status "on"

# default statusbar color
set-option -g status-style bg='#{@tokyonight_black}',fg='#{@tokyonight_white}' # bg=bg1, fg=fg1

# default window title colors
set-window-option -g window-status-style bg='#{@tokyonight_white}',fg='#{@tokyonight_black}' # bg=yellow, fg=bg1

# default window with an activity alert
set-window-option -g window-status-activity-style bg='#{@tokyonight_black}',fg='#{@tokyonight_white}' # bg=bg1, fg=fg3

# active window title colors
set-window-option -g window-status-current-style bg='#{@tokyonight_blue}',fg='#{@tokyonight_black}' # fg=bg1

# pane border
set-option -g pane-active-border-style fg='#{@tokyonight_white}' #fg2
set-option -g pane-border-style fg='#{@tokyonight_black}' #bg1

# message infos
set-option -g message-style bg='#{@tokyonight_black}',fg='#{@tokyonight_white}' # bg=bg2, fg=fg1

# writing commands inactive
set-option -g message-command-style bg='#{@tokyonight_white}',fg='#{@tokyonight_black}' # bg=fg3, fg=bg1

# pane number display
set-option -g display-panes-active-colour "#aab2bf" #fg2
set-option -g display-panes-colour "#282c34" #bg1

# clock
set-window-option -g clock-mode-colour "#61afef" #blue

# bell
set-window-option -g window-status-bell-style bg='#{@tokyonight_blue}',fg='#{@tokyonight_black}' # bg=blue, fg=bg

## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
set-option -g status-justify "left"
set-option -g status-left-style none
set-option -g status-left-length "80"
set-option -g status-right-style none
set-option -g status-right-length "80"
set-window-option -g window-status-separator ""

set-option -g status-left "#[bg='#{@tokyonight_black}',fg='#{@tokyonight_white}'] #S #[bg='#{@tokyonight_black}',fg='#{@tokyonight_white}',nobold,noitalics,nounderscore]"
set-option -g status-right "#[bg='#{@tokyonight_black}',fg='#{@tokyonight_white}' nobold, nounderscore, noitalics]#[bg='#{@tokyonight_black}',fg='#{@tokyonight_white}'] %Y-%m-%d | %H:%M #[bg='#{@tokyonight_black}',fg='#{@tokyonight_white}',noitalics,nounderscore]#[bg='#{@tokyonight_white}',fg='#{@tokyonight_black}'] #h "

set-window-option -g window-status-current-format "#[bg='#{@tokyonight_white}',fg='#{@tokyonight_black}',nobold,noitalics,nounderscore]#[bg='#{@tokyonight_white}',fg='#{@tokyonight_black}'] #I #[bg='#{@tokyonight_white}',fg='#{@tokyonight_black}',bold] #W#{?window_zoomed_flag,*Z,} #[bg='#{@tokyonight_black}',fg='#{@tokyonight_white}',nobold,noitalics,nounderscore]"
set-window-option -g window-status-format "#[bg='#{@tokyonight_black}',fg='#{@tokyonight_white}',noitalics]#[bg='#{@tokyonight_black}',fg='#{@tokyonight_white}'] #I #[bg='#{@tokyonight_black}',fg='#{@tokyonight_white}'] #W #[bg='#{@tokyonight_visual_grey}',fg='#{@tokyonight_comment_grey}',noitalics]"

# vim: set ft=tmux tw=0 nowrap:
