#!/bin/zsh
# Path to your oh-my-zsh installation.

export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval $(thefuck --alias)

source ~/.bash_profile
source ~/Documents/Repositories/dotfiles/macos/aws/find-instance.sh

# AWS Command completion TODO
# fpath=(~/.zsh/completion $fpath)
# autoload -Uz compinit && compinit -i
# source ~/Library/Python/3.6/bin/aws_zsh_completer.sh

export SLACK_DEVELOPER_MENU=true
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
