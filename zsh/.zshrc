# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom-theme"

plugins=(virtualenv git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#fastfetch
#hyfetch
echo " "
export PATH=$HOME/.local/bin:$PATH
export EDITOR=nvim
export MANPAGER='nvim +Man!'
alias vim="nvim"
alias code="codium"
#alias ssh="kitten ssh"
alias android_studio="~/apps/android-studio/bin/studio"
alias discord="~/apps/Discord/Discord"
alias intellij="~/apps/idea-IU-251.25410.129/bin/idea"
#fortune | cowsay -f tux | lolcat --seed 124
