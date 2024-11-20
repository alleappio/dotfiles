# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira-custom"

plugins=(virtualenv git)

source $ZSH/oh-my-zsh.sh

fastfetch
echo " "
export PATH=$HOME/.local/bin:$PATH
export EDITOR=nvim
export MANPAGER='nvim +Man!'
