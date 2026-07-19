#!/bin/bash
# tmux sessions
function tmuxs(){
    if [[ $1 ]]; then
        ~/dotfiles/tmux_sessions/$1.sh
    else
        ls --color=no ~/dotfiles/tmux_sessions/ | sed 's/\.sh$//'
    fi
}

# autocompletions
function _complete_tmuxs(){
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(compgen -W "$(ls --color=no ~/dotfiles/tmux_sessions/ | sed 's/\.sh$//')" -- "$cur"))
}

complete -F _complete_tmuxs tmuxs
