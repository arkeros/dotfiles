#!/bin/sh

# Fisher
echo $(which fish) | tee -a /etc/shells
chsh -s $(which fish) $(whoami) 

# stow
stow -t ~ git
stow -t ~/.config/fish fish

fish
