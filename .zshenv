#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add golang binaries to path
export PATH="$PATH:$GOPATH/bin"

# Add jv scripts to path
export PATH="$PATH:$HOME/.config/jv"

# Add pythong binaries to path
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

export GOPATH="$HOME/dev/go:$GOPATH"

# Spaceship prompt configs to play nice with Warp
export SPACESHIP_PROMPT_ASYNC=false
export SPACESHIP_PROMPT_ADD_NEWLINE=false
if [[ $TERM_PROGRAM == "WarpTerminal" ]]; then
  # Warp doesnt support multi-line prompts yet
  export SPACESHIP_PROMPT_SEPARATE_LINE=false
fi

# Path and completions for the Google Cloud SDK.
if [ -d /opt/homebrew/share/google-cloud-sdk/ ]; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'

# ---------- FullStory ----------
#
# Ignore FullStory's PS1
export SKIP_FS_PS1=true
