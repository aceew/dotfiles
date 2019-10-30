#!/bin/bash

# Disable Natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Dock Settings
defaults write com.apple.dock tilesize -int 40
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock show-recents -bool false
defaults write -g com.apple.mouse.scaling 5
defaults write com.apple.dock show-recents -bool false

killall Dock
killall Finder