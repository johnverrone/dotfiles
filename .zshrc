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

# Customize to your needs...
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfnp='cf login -a api.run-np.homedepot.com'
alias cfza='cf login -a api.run-za.homedepot.com'
alias cfzb='cf login -a api.run-zb.homedepot.com'
alias ow='cd ~/dev/OrangeWorks'
bindkey -e


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
