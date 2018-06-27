#!/usr/bin/env bash

set -eu

# ask for the sudo password upfront
echo "Setting prefererred macOS settings. Please enter your password!"
sudo -v

# close "System Preferences.App" to prevent from overriding settings
osascript -e 'tell application "System Preferences" to quit'

#########################################
# Terminal								#
#########################################
# enable secure keyboard entry in terminal.app
defaults write com.apple.terminal SecureKeyboardEntry -bool true
