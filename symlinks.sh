#!/usr/bin/env bash

set -eu

# get the path of the repo, symlinks require full paths
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Symlinking files..."

# Symlink dotfiles
ln -sf "$DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DIR/.gitignore_global" "$HOME/.gitignore_global"

echo "done symlinking"


# docker run --name nginx -d -p 8080:80 -v /Users/jandriesen/tempfolder:/usr/share/nginx/html nginx
