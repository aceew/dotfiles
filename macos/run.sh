#!/bin/bash

if ! type "brew" > /dev/null; then
	echo "Installing homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	xcode-select --install
fi

echo "Updating homebrew"
brew update

cd brew || exit 1
echo "Installing/updating dependencies from $(pwd)/Brewfile"
# brew bundle
cd ../

echo "Linking dotfiles"
ln -s ./.bash_profile ~/.bash_profile
ln -s ./.zshrc ~/.zshrc

echo "Installing/updating crontab"
crontab ./cron/aaron

echo "Setting up AWS installation"
cd aws || exit 1
./setup.sh

echo "Rotating all AWS keys"
./rotate-keys.sh
cd ../
