#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export SPACESHIP_DIR_COLOR=208 # orange

# dotfile management
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
bindkey -e

alias svc='$FS_HOME/go/src/fs/services'

# spotify cli
alias sp='spotify'

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf open files
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() (
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f /Users/johnverrone/.fsprofile ]; then
  source /Users/johnverrone/.fsprofile
  eval "$(direnv hook zsh)"
  if [ -e /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; else eval "$(/opt/homebrew/bin/brew shellenv)"; fi
fi
