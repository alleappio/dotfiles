source-file ~/.config/tmux/colors.tmux 

set -g visual-activity off 
set -g visual-bell off 
set -g visual-silence off 
setw -g monitor-activity off 
set -g bell-action none 

# clock mode 
setw -g clock-mode-colour white 

# copy mode 
setw -g mode-style 'fg=black bg=#{@primary}' 

# panes 
set -g pane-border-style 'fg=black' 
set -g pane-active-border-style 'fg=#{@primary}' 

# statusbar 
set -g status-justify left 
set -g status-style 'fg=#{@primary}' 

set -g status-left-style 'bg=black fg=white' 
set -g status-left ' #S ' 
set -g status-left-length 10 

set -g status-right-style 'fg=white bg=black' 
set -g status-right '%Y-%m-%d %H:%M ' 
set -g status-right-length 50 

setw -g window-status-current-style 'fg=black bg=#{@primary}' 
setw -g window-status-current-format ' #I #W #F ' 

setw -g window-status-style 'fg=white bg=black' 
setw -g window-status-format ' #I #[fg=white]#W #[fg=white]#F ' 

setw -g window-status-bell-style 'fg=white bg=#{@primary}' 

# messages 
set -g message-style 'fg=black bg=#{@primary}'
