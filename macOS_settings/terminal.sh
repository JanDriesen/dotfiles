#!/usr/bin/env bash
set -eu
#
# Installation script to setup the terminal
# close "System Preferences.app" to prevent it from overriding settings
osascript -e 'tell application "System Preferences" to quit'

# enable secure keyboard entry in terminal.app
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# TODO: add window size, backgroundcolor etc. check profile export (terminal settings)
