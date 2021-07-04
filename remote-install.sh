#!/usr/bin/env sh

SOURCE="https://github.com/arkeros/dotfiles"
TARGET="$HOME/dotfiles"

apt-get update
apt-get install -y git 

git clone $SOURCE $TARGET


