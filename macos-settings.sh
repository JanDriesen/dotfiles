#!/usr/bin/env bash

set -eu

# ask for the sudo password upfront
echo "Setting prefererred macOS settings. Please enter your password!"
sudo -v

# execute scripts in macOS_settings/
source ./macOS_settings/dock.sh
source ./macOS_settings/finder.sh
source ./macOS_settings/system_preferences.sh
source ./macOS_settings/terminal.sh
source ./macOS_settings/appstore.sh
source ./macOS_settings/apps_misc.sh
