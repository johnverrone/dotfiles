#!/usr/bin/env zsh

# Fail if any errors occur
set -e

echo "Caching password..."
sudo -K
sudo true;
clear

MY_DIR="$(dirname "$0")"

source ${MY_DIR}/scripts/prezto-config.sh
source ${MY_DIR}/scripts/pathogen.sh
source ${MY_DIR}/scripts/dotfiles.sh
source ${MY_DIR}/scripts/iterm-setup.sh
