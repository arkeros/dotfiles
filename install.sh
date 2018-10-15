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
brew install yarn --without-node

# https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#hyperkit-driver 
curl -Lo docker-machine-driver-hyperkit https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
&& chmod +x docker-machine-driver-hyperkit \
&& sudo cp docker-machine-driver-hyperkit /usr/local/bin/ \
&& rm docker-machine-driver-hyperkit \
&& sudo chown root:wheel /usr/local/bin/docker-machine-driver-hyperkit \
&& sudo chmod u+s /usr/local/bin/docker-machine-driver-hyperkit

# Fisher
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher add edc/bass

# nvm
echo "› install nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
bass source ~/.nvm/nvm.sh --no-use ';' nvm install 10
# bass source ~/.nvm/nvm.sh --no-use ';' nvm use 10

# stow
stow -t ~ git
stow -t ~/Library/Application\ Support/Code/User vscode

# vscode
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension eg2.tslint
code --install-extension mauve.terraform
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension PeterJausovec.vscode-docker
code --install-extension dbaeumer.jshint
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension eg2.vscode-npm-script
code --install-extension esbenp.prettier-vscode
code --install-extension msjsdiag.debugger-for-chrome
