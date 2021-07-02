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

export GOPATH="$HOME/dev/go:$GOPATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/john/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/john/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/john/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/john/google-cloud-sdk/completion.zsh.inc'; fi

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'

# ---------- FullStory ----------
#
# Ignore FullStory's PS1
export SKIP_FS_PS1=true
