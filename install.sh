#!/usr/bin/env bash
set -eu

# ask for the sudo password upfront
echo "Setting up the system! Please enter your password!"
sudo -v

# Install Homebrew and packages
source scripts/brew/install_brew.sh

# Install ruby via rbenv and use it globally
if [[ $(rbenv global) != "2.6.5" ]]; then
    rbenv install 2.6.5
    rbenv global 2.6.5
fi

# Install various gems
~/.rbenv/shims/gem install cocoapods fastlane xcodeproj --no-document
~/.rbenv/shims/gem cleanup

# install oh-my-zsh
if [ -e "/bin/zsh" ]; then
    if [ ! -e "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else echo "oh my zsh is already installed!"
    fi
else echo "Zsh is not installed. Failed to install oh-my-zsh!"
fi

# Create and update symlinks
source scripts/install_symlinks.sh

# Apply macOS and settings for some apps
source scripts/install_settings.sh

echo "TODO: Set the display scaling to \"more space\""
echo "TODO: Download Apps from the AppStore: Magnet, HazeOver, Xcode, etc"
echo "TODO: Start Docker Desktop manually once (no account needed, just skip/close the sign-in prompt)"
echo "TODO: To enable the Kubernetes cluster: Docker Desktop > Settings (gear icon) > Kubernetes tab > check \"Enable Kubernetes\" > Apply & Restart"

echo "Done."
