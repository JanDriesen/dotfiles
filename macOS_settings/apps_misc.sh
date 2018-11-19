#!/usr/bin/env bash
set -eu
#
# Installation script to setup some apps
# close "System Preferences.app" to prevent it from overriding settings
osascript -e 'tell application "System Preferences" to quit'

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
# iTunes 								#
#########################################

# TODO: disable automatic opening when devices are plugged in

#########################################
# Photos 								#
#########################################

# prevent photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

#########################################
# Messages								#
#########################################

# disable automatic emoji 
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# disable smart quotes as its annoying for messages
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false