#!/bin/bash

# Disable Natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Dock Settings
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock show-recents -bool false
defaults write -g com.apple.mouse.scaling 5
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock static-only -bool true

# Menu Bar
defaults write com.apple.menuextra.battery ShowPercent YES
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/Volume.menu"

# Iterm2
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$(pwd)/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

killall Dock
killall Finder
killall SystemUIServer
