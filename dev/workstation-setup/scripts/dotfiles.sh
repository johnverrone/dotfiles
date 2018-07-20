echo
echo "Configuring jverrone3/dotfiles"

touch $HOME/.gitignore
echo ".cfg" >> $HOME/.gitignore
git clone --bare https://github.com/jverrone3/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout

config config --local status.showUntrackedFiles no
