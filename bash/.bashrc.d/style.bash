BLUE="\[$(tput bold; tput setaf 4)\]"
GREEN="\[$(tput bold; tput setaf 2)\]"
YELLOW="\[$(tput sgr0; tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"

git_status() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
      local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
      local dirty=""
        if ! git diff --quiet || ! git diff --cached --quiet; then
            dirty="*"
        fi
        echo " ($branch$dirty)"
    fi
}

update_prompt () {
  GIT_STATUS=$(git_status)
  #PS1="${BLUE}\W${YELLOW}$GIT_BRANCH${GREEN} ->${RESET} "
  PS1="[\u@\h \W$GIT_STATUS]\\$ "
}

PROMPT_COMMAND=update_prompt
