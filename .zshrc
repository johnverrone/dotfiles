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

# Customize to your needs...
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
bindkey -e

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jxv5520/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jxv5520/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jxv5520/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jxv5520/google-cloud-sdk/completion.zsh.inc'; fi
