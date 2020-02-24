#!/usr/bin/env bash

set -eu

# ask for the sudo password upfront
echo "Setting prefererred macOS settings. Please enter your password!"
sudo -v

# close "System Preferences.app" to prevent it from overriding settings
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# OSX                                                                         #
###############################################################################

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

# set accent color to yellow
# nil blue
# -1 graphite
# 0 red
# 1 orange
# 2 yellow
# 3 green
# 5 purple
# 6 pink
defaults write -globalDomain "AccentColor" -int 2

# disable auto correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# avoid creating .DS_Store on network volumes or USB volumes
defaults write com.apple.desktopservices NSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices NSDontWriteUSBStores -bool true

# disable annoying smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

###############################################################################
# Finder                                                                      #
###############################################################################

# Show all hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Use current folder as default folder when performing a search
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use list view as default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Enable text selection in QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# set Desktop as the default location for the new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# show icons for hard drives and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

###############################################################################
# Desktop and Dock                                                            #
###############################################################################

# Set the desktop background image
osascript -e 'tell application "System Events" to set picture of every desktop to "'"$(pwd)/Assets/wallpaper.jpg"'"'

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
# only show settings and downloads in dock
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/System Preferences.app" --section apps --position 0
dockutil --no-restart --add "$HOME/Downloads" --view grid --display folder

# restart Dock
killall Dock

#############################################
# Terminal      							#
#############################################

# enable secure keyboard entry in terminal.app
defaults write com.apple.terminal SecureKeyboardEntry -bool true

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
# TODO: unexpected argument int, leaving defaults unchanged!
#defaults write com.apple.ActivityMonitor SortDirection - int 0

#############################################
# AppStore  								#
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
#defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# turn on auto update
defaults write com.apple.commerce AutoUpdate -bool true

# allow the app store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

###############################################################################
# iTunes                                                                      #
###############################################################################

# Don't start iTunes when using the media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

#########################################
# Photos 								#
#########################################

# prevent photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

#############################################
# Time Machine								#
#############################################

# prevent time machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# disable local time machine backups 
# TODO: disablelocal: unrecognized verb.!
#hash tmutil &> /dev/null && sudo tmutil disablelocal
