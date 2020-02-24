#!/usr/bin/bash

# function to show processes with the given name
#func psgrep() {
#    ps up $(pgrep -f $@) 2>&-;
#}

# function to find the simulator folder for the given device argument
#func findDeviceDir() {
#	grep -r -e $0 --include="device.plist" ~/Library/Developer/CoreSimulator/Devices
#}


# function to change into the the specified simulator folder
#func cdDeviceDir() {
#	// todo
#}

# function to clean the derived xcode data
# func cleanXcode() {
# rm -rf ~/Library/Developer/Xcode/DerivedData
#}

# funcion to enable concurrent build tasks in Xcode. New with Xcode 9.2.
# could slow down the system because more memory is used
# func enableParralelBuild() {
# defaults write com.apple.dt.Xcode BuildSystemScheduleInherentlyParallelCommandsExclusively -bool NO
#}

# func disableParralelBuild() {
# defaults delete com.apple.dt.Xcode BuildSystemScheduleInherentlyParallelCommandsExclusively
#}