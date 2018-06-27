#!/usr/bin/env bash

set -eu

# ask for the sudo password upfront
echo "Setting prefererred macOS settings. Please enter your password!"
sudo -v

# close "System Preferences.App" to prevent from overriding settings
osascript -e 'tell application "System Preferences" to quit'

#################################################
# macOS 										#
#################################################
# Use expanded save panel as default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# disable annoying smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# set disk as default save target, not iCloud
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# decrease key repeat delay and increase repeate rate
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

# disable auto correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# avoid creating .DS_Store on network volumes or USB volumes
defaults write com.apple.desktopservices NSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices NSDontWriteUSBStores -bool true

# use dark mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# show battery status in percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# set the display scaling to "more space" (1900x1200)
# TODO

#############################################
# Activity Monitor							#
#############################################
# show the main window when launching activity monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# visualize CPU usage in the activity monitor dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# show all processes in activity monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# sort activity monitor results by cpu usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection - int 0

#########################################
# Terminal								#
#########################################
# enable secure keyboard entry in terminal.app
defaults write com.apple.terminal SecureKeyboardEntry -bool true

#############################################
# Time Machine								#
#############################################

# prevent time machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# disable local time machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

#############################################
# Mac App Store								#
#############################################

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

#########################################
# Photos 								#
#########################################

# prevent photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

#########################################################################
# Messages								#
#########################################################################

# disable automatic emoji 
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# disable smart quotes as its annoying for messages
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false