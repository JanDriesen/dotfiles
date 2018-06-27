#!/usr/bin/env bash
set -eu
#
# Installation script to setup the system preferences
# close "System Preferences.app" to prevent it from overriding settings
osascript -e 'tell application "System Preferences" to quit'

# # TODO: set the display scaling to "more space" (1900x1200)

# Use expanded save panel as default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# show battery status in percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# decrease key repeat delay and increase repeate rate
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

# use dark mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# disable auto correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# avoid creating .DS_Store on network volumes or USB volumes
defaults write com.apple.desktopservices NSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices NSDontWriteUSBStores -bool true

# disable annoying smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#############################################
# Time Machine								#
#############################################

# prevent time machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# disable local time machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal
