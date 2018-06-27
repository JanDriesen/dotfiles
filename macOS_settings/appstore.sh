#!/usr/bin/env bash
set -eu
#
# Installation script to setup the app store
# close "System Preferences.app" to prevent it from overriding settings
osascript -e 'tell application "System Preferences" to quit'

# enable the webkit developer tools in the mac app store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# enable debug menu in the mac app store
defaults write com.apple.appstore ShowDebugMenu -bool true

# enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# donwload newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# install system data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# automatically download apps purchased on other macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# turn on auto update
defaults write com.apple.commerce AutoUpdate -bool true

# allow the app store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true
