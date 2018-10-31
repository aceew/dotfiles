#!/bin/bash

if ! type "brew" > /dev/null; then
	echo "Installing homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	xcode-select --install
fi

echo "Updating homebrew"
brew update

cd brew
echo "Installing/updating dependencies from $(pwd)/Brewfile"
brew bundle
cd ../
