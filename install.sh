#!/usr/bin/env bash
set -eu

# ask for the sudo password upfront
echo "Setting up the system! Please enter your password!"
sudo -v

# install brew 
# check if brew is available. install if not
if ! [ -x $(command -v brew) ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else echo "brew is already installed"
fi

# install cli tools and gui apps with with brew bundle
brew update
brew tap homebrew/bundle
brew bundle
brew cleanup

# Install ruby via rbenv and use it globally
if [[ $(rbenv global) != "2.6.5" ]]; then
    rbenv install 2.6.5
    rbenv global 2.6.5
fi

# Install various gems
~/.rbenv/shims/gem install cocoapods fastlane --no-document
~/.rbenv/shims/gem cleanup

# check if zsh has been installed and set it as default shell, also install oh-my-zsh
if [ -e "/usr/local/bin/zsh" ]; then
    # add zsh to approved shells
    echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells

    # change shell for current user
    chsh -s "/usr/local/bin/zsh"

    # install oh-my-zsh
    if ![ -r "$HOME/.oh-my-zsh"]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else echo "oh my zsh is already installed!"
    fi
else echo "Zsh is not installed. Failed to install oh-my-zsh!"
fi

# Create and update symlinks
source symlinks.sh

# Apply macOS and settings for some apps
source settings.sh

# set macOS environment
#source ./macos-settings.sh
echo "TODO: Set the display scaling to \"more space\""
echo "TODO: Download Apps from the AppStore: Magnet, HazeOver, Xcode, etc"

echo "Done."