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

# ensure brew bin is in PATH
export PATH="/opt/homebrew/bin:$PATH"

# load spaceship prompt
source /opt/homebrew/opt/spaceship/spaceship.zsh
export SPACESHIP_DIR_COLOR=208 # orange

# dotfile management
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
bindkey -e

# Claude Code to local installation

# spotify cli
alias sp='spotify'

# personal monorepo
alias jv='cd ~/dev/jv'

# fzf projects
alias cproj='cd $(find ~/dev -type d -maxdepth 3 -name ".git" -print | sed "s|/.git||" | fzf)'

# eza - better ls
alias ll='eza -l --icons --git -a --group-directories-first'
alias lt='eza --tree --level=2 -l --icons --git --group-directories-first --git-ignore'
alias lta='eza --tree --level=2 -l --icons --git --group-directories-first'

# fzf open branches and checkout the selection
alias ghpr='gh pr list --author "@me" | fzf --ansi --height "40%" | awk "{print \$1}" | xargs -I {} gh pr checkout {}'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

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

# Change project directory for all tmux panes
# TODO: fix this.
switchproj() {
  local root="$HOME/dev"
  local proj

  if [ -z "$1" ]; then
    proj=$(find "$root" -mindepth 2 -maxdepth 3 -type d -name ".git" \
      | sed "s|$root/||; s|/.git||" | fzf)
  else
    proj="$1"
  fi

  [ -z "$proj" ] && return

  local path="$root/$proj"

  tmux send-keys -t dev:0 "cd $path && clear" C-m
  tmux send-keys -t dev:1 "cd $path && clear" C-m
  tmux send-keys -t dev:2 "cd $path && clear" C-m
  tmux send-keys -t dev:3 "cd $path && clear" C-m

  tmux rename-session -t dev "dev:$proj"
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fullstory stuff
if [ -f "$HOME/.fsprofile" ]; then
  source "$HOME/.fsprofile"
  eval "$(/opt/homebrew/bin/direnv hook zsh)"
  if [ -e /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; else eval "$(/opt/homebrew/bin/brew shellenv)"; fi
  alias svc='$FS_HOME/go/src/fs/services'

  # function to shorthand `make <cogs> && ./services restart <cogs>`
  function mr() {
    echo "rebuiding and restarting: $@"
    make "$@" && ./services restart "$@"
  }
fi

# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/johnverrone/.zsh/completions:"* ]]; then export FPATH="/Users/johnverrone/.zsh/completions:$FPATH"; fi

# bun completions
[ -s "/Users/john/.bun/_bun" ] && source "/Users/john/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/john/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"

# deno
[ -s "/Users/johnverrone/.deno/env" ] && source "/Users/johnverrone/.deno/env"

# ngrok path completions
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

if command -v direnv 2>&1 >/dev/null
then
  eval "$(direnv hook zsh)"
fi
