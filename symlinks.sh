#!/usr/bin/env bash

set -eu

# get the path of the repo, symlinks require full paths
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink dotfiles
echo "Symlinking dotfiles..."
ln -sf "$DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DIR/.gemrc" "$HOME/.gemrc"
ln -sf "$DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DIR/.gitignore_global" "$HOME/.gitignore_global"

# Symlink the App Settings
# todo: ln -s "$DIR/AppSettings/Terminal/" "$HOME/Library/Preferences/com.apple.Terminal.plist"

echo "done symlinking"