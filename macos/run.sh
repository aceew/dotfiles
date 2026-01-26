#!/bin/bash

BASEDIR=$(dirname "$0")

if ! type "brew" > /dev/null; then
	echo "Installing homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

if [ ! -d ~/.nvm ]; then
	mkdir -p ~/.nvm
fi

echo "Linking dotfiles"
ln -sfn "$(pwd)/.bash_profile" ~/.bash_profile
ln -sfn "$(pwd)/.zshrc" ~/.zshrc
ln -sfn "$(pwd)/.gitconfig" ~/.gitconfig
ln -sfn "$(pwd)/.vimrc" ~/.vimrc

if ! rbenv versions | grep -q "3.3.5"; then
	echo "Installing Ruby 3.3.5"
	rbenv install 3.3.5
	rbenv global 3.3.5
fi

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

echo "Setting up mobile development settings"
./mobile/run.sh