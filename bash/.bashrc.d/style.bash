BLUE="\[$(tput bold; tput setaf 4)\]"
GREEN="\[$(tput bold; tput setaf 2)\]"
YELLOW="\[$(tput sgr0; tput setaf 3)\]"
RED="\[$(tput sgr0; tput setaf 1)\]"
RESET="\[$(tput sgr0)\]"

git_status() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
      local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
      local dirty=""
      if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
            dirty="*"
        fi
        echo " ${YELLOW}($branch${RED}$dirty${YELLOW})${RESET}"
    fi
}

invirtualenv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "${GREEN}(venv)${RESET}"
  fi
}

update_prompt () {
  GIT_STATUS=$(git_status)
  VENV_STATUS=$(invirtualenv)
  PS1="[\u@\h ${BLUE}\W${RESET}$GIT_STATUS$VENV_STATUS]${RESET}$ "
}

PROMPT_COMMAND=update_prompt
