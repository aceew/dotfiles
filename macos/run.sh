#!/bin/bash

BASEDIR=$(dirname "$0")

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


cd "${BASEDIR}/brew" || exit 1
echo "Installing/updating dependencies from ${BASEDIR}/Brewfile"
brew bundle
cd ../

echo "Linking dotfiles"
ln -sfn "${BASEDIR}/.bash_profile" ~/.bash_profile
ln -sfn "${BASEDIR}/.zshrc" ~/.zshrc
ln -sfn "${BASEDIR}/.gitconfig" ~/.gitconfig
ln -sfn "${BASEDIR}/.vimrc" ~/.vimrc

echo "Installing/updating crontab"
crontab ./cron/aaron

echo "Setting up AWS installation"
./aws/setup.sh

echo "Rotating all AWS keys"
./aws/rotate-keys.sh

echo "Setting up vim"
./vim/setup.sh

echo "Setting up Mac Config"
./mac-settings.sh
