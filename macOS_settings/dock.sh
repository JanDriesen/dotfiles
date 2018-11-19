#!/usr/bin/env bash
set -eu

echo "Setting up the dock..."
#
# Installation script to setup the Dock and the Desktop
# close "System Preferences.app" to prevent it from overriding settings
osascript -e 'tell application "System Preferences" to quit'

#
# Desktop
# -----------------
# set the desktop background image
# TODO: add variable for the background image path
#osascript <<'APPLESCRIPT'
#  tell application "System Events"
#    set desktopCount to count of desktops
#    repeat with desktopNumber from 1 to desktopCount
#      tell desktop desktopNumber
#        set picture to "/Library/Desktop Pictures/Solid Colors/Solid Gray Pro Ultra Dark.png"
#      end tell
#    end repeat
#  end tell
#APPLESCRIPT

# TODO: add most recent used disabling

#
# Dock
# ------------------
# show downloads directory and system settings.app in the dock
# dockutil requires dockutil https://github.com/kcrawford/dockutil.git. should be installed with brew
if [ -x "$(command -v dockutil)" ]; then
  dockutil --no-restart --remove all
  dockutil --no-restart --add "/Applications/System Preferences.app" --section apps --position 0
  # show downloads as grid view and display a folder icon
  dockutil --no-restart --add "$HOME/Downloads" --view grid --display folder
else
    echo "dockutil is not installed. keeping the dock unchanged"
fi

# disable dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# dont show dashboard as a space
defaults write com.apple.dock dashboard-in-overlay -bool true

# dont automatically rearrange spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# enable auto hide
defaults write com.apple.dock autohide -bool true

# remove auto hide delay
defaults write com.apple.dock autohide-delay -float 0

# set animation duration to 0.5 when hiding the dock
defaults write com.apple.dock autohide-time-modifier -float 0.5

# adjust size of dock icons
defaults write com.apple.dock tilesize -int 50

# use translucent icons for hidden apps
defaults write com.apple.dock showhidden -bool true

# speed up mission control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# dont group windows by application in mission control
defaults write com.apple.dock expose-group-by-app -bool false

#restart dock
killall Dock
