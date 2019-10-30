#!/bin/bash

if ! type "brew" > /dev/null; then
	echo "Installing homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	sudo xcode-select --install
fi

if [ ! -d ~/.oh-my-zsh ]; then
	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "Updating homebrew"
brew update

cd brew || exit 1
echo "Installing/updating dependencies from $(pwd)/Brewfile"
brew bundle
cd ../

echo "Linking dotfiles"
ln -sfn "$(pwd)/.bash_profile" ~/.bash_profile
ln -sfn "$(pwd)/.zshrc" ~/.zshrc
ln -sfn "$(pwd)/.gitconfig" ~/.gitconfig
ln -sfn "$(pwd)/.vimrc" ~/.vimrc

echo "Installing/updating crontab"
crontab ./cron/aaron

echo "Setting up AWS installation"
cd aws || exit 1
./setup.sh

echo "Rotating all AWS keys"
./rotate-keys.sh
cd ../
