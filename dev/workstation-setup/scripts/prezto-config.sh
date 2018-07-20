echo
echo "Configuring prezto"

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" || true

echo "setting zsh as default shell"
chsh -s /bin/zsh

