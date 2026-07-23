#!/usr/bin/env bash

set -eu

# get the path of the dotfiles, symlinks require full paths
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_DIR="$( cd "$SCRIPT_DIR/../home" && pwd )"

# Symlink dotfiles
echo "Symlinking dotfiles..."
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.gemrc" "$HOME/.gemrc"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"

# core.excludesfile can't be a hardcoded path in the committed .gitconfig
# (different $HOME per machine), so set it dynamically instead
git config --global core.excludesfile "$HOME/.gitignore_global"

# Symlink the App Settings
# todo: ln -s "$DOTFILES_DIR/AppSettings/Terminal/" "$HOME/Library/Preferences/com.apple.Terminal.plist"

echo "done symlinking"
