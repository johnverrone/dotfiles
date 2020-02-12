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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jxv5520/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jxv5520/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jxv5520/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jxv5520/google-cloud-sdk/completion.zsh.inc'; fi

export FZF_DEFAULT_COMMAND='rg --files --hidden'

# ---------- FullStory ----------
#
# Ignore FullStory's PS1
export SKIP_FS_PS1=true
