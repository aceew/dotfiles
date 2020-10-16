#!/bin/bash

# Default shell to zsh
export SHELL=/usr/local/bin/zsh

# Homebrew installs
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# aws-sdk
export AWS_SHARED_CREDENTIALS_FILE=~/.secrets/.aws/credentials
export AWS_PAGER=""

# aws-sdk credentials in javascript
export AWS_SDK_LOAD_CONFIG=1

# go
export GOPATH=~/go
export PATH=~/go/bin:$PATH

# GPG_TTY
export GPG_TTY=$(tty)
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Android

export ANDROID_HOME=~/Library/Android/sdk