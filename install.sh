#!/bin/sh

# Ask for the administrator password upfront
sudo -v

echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a

# Check for Homebrew
if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle

# Fisher
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
fish
fisher add edc/bass

# nvm
echo "› install nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
bass source ~/.nvm/nvm.sh --no-use
nvm install 10
# nvm use 10

# stow
stow -t ~ git
stow -t ~/Library/Application\ Support/Code/User vscode

# vscode
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension eg2.tslint
code --install-extension mauve.terraform
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension PeterJausovec.vscode-docker
