#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

SUDO=''
if [ "$(id -u)" -ne 0 ]; then
	    SUDO='sudo'
	    # Ask for the administrator password upfront
	    sudo -v
fi

$SUDO apt-get update
$SUDO apt-get install -y fish zoxide direnv neovim stow tree git make

# stow
mkdir -p ~/.config/fish
#stow -t ~ git
stow -t ~/.config/fish fish

# Fisher
echo $(which fish) | $SUDO tee -a /etc/shells
$SUDO chsh -s $(which fish) $(whoami)

# fzf
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/src/github.com/junegunn/fzf
fi
~/src/github.com/junegunn/fzf/install --all
