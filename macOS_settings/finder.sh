#!/usr/bin/env bash
set -eu
#
# Installation script to setup Finder.app
# close "System Preferences.app" to prevent it from overriding settings
osascript -e 'tell application "System Preferences" to quit'

# Show all hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# keep folders on top
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# use list view as default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# use the current folder as default folder when performing  a search
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# set Desktop as the default location for the new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# show icons for hard drives and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# disable the window animations and the get info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true
