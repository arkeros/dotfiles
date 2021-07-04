#!/bin/sh
export DEBIAN_FRONTEND=noninteractive

SUDO=''
if (( id -u )); then
	    SUDO='sudo'
	    # Ask for the administrator password upfront
	    sudo -v
fi

$SUDO apt-get update
$SUDO apt-get install -y fish neovim stow tree git make

# Fisher
echo $(which fish) | $SUDO tee -a /etc/shells
chsh -s $(which fish) $(whoami) 

# stow
stow -t ~ git
stow -t ~/.config/fish fish

fish
