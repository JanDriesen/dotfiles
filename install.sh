#!/usr/bin/env bash
set -eu

# ask for the sudo password upfront
echo "Setting up the system! Please enter your password!"
sudo -v

# install brew 
# check if brew is available. install if not
if ! [ -x "$(command -v brew)" ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install zsh and oh-my-zsh
# check if brew is available.
if [ -x "$(command -v brew)" ]; then

    # install zsh via brew
    brew install zsh

    # check if zsh has been installed
    if [ -e "/usr/local/bin/zsh" ]; then
        # add zsh to approved shells
        echo /usr/local/bin | sudo tee -a /etc/shells

        # change shell for current user
        chsh -s /usr/local/bin/zsh

        # install oh-my-zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else echo "Zsh is not installed. Failed to install oh-my-zsh!"
    fi
else echo "brew is not installed. Failed to install zsh!"
fi

# install dockutil with brew
if [ -x "$(command -v brew)" ]; then
    brew install dockutil
else echo "brew is not installed. Failed to install dockutil!"
fi

# set macOS environment
source ./macos-settings.sh

echo "TODO: Set the display scaling to \"more space\""
echo "TODO: Download Apps from the AppStore: Magnet, HazeOver, Xcode"

echo "Done."