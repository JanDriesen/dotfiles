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

##################################################
# Finder										 #
##################################################
# disable window animations and get info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# set Desktop as the default location for the new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# show icons for hard drives and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show all hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# keep folders on top
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# use the current folder as default folder when performing  a search
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# use list view as default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

#####################################################
# Desktop and Dock									#
#####################################################
# set the desktop background image
osascript <<'APPLESCRIPT'
  tell application "System Events"
    set desktopCount to count of desktops
    repeat with desktopNumber from 1 to desktopCount
      tell desktop desktopNumber
        set picture to "/Library/Desktop Pictures/Solid Colors/Solid Gray Pro Ultra Dark.png"
      end tell
    end repeat
  end tell
APPLESCRIPT

# Only show Downloads in the dock.
# dockutil requires dockutil https://github.com/kcrawford/dockutil.git. should be installed with brew
if [ -x "$(command -v dockutil)" ]; then
  dockutil --no-restart --remove all
  dockutil --no-restart --add "/Applications/System Preferences.app" --section others --position 0
  dockutil --no-restart --add "$HOME/Downloads" --view grid --display folder
fi

# speed up mission control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# dont group windows by application in mission control
defaults write com.apple.dock expose-group-by-app -bool false

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

# remove the animation when hiding the dock
defaults write com.apple.dock autohide-time-modifier -float 0.5

# adjust size of dock icons
defaults write com.apple.dock tilesize -int 50

# use translucent icons for hidden apps
defaults write com.apple.dock showhidden -bool true

killall Dock

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