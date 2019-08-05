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

# setup NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GCP Authentication
export GOOGLE_APPLICATION_CREDENTIALS=~/.np-pro-desk-creds.json

# GOPATH inside /dev
export GOPATH=$HOME/dev/go

# Add golang binaries to path
export PATH="$PATH:$GOPATH/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jxv5520/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jxv5520/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jxv5520/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jxv5520/google-cloud-sdk/completion.zsh.inc'; fi

# Add flutter to path
export PATH="$PATH:$HOME/dev/flutter/flutter/bin"
