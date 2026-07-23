#!/usr/bin/env bash

set -eu

# get the path of the repo, needed to find the package list files
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install brew itself if it's missing
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "brew is already installed"
fi

brew update

# install a list of formulae, or casks if called with --cask, skipping ones
# that are already installed
install_packages() {
    local cask_flag=""
    if [[ "$1" == "--cask" ]]; then
        cask_flag="--cask"
        shift
    fi
    for pkg in "$@"; do
        if brew list $cask_flag "$pkg" &>/dev/null; then
            echo "$pkg is already installed"
        else
            brew install $cask_flag "$pkg"
        fi
    done
}

FORMULAE=()
while IFS= read -r pkg; do
    FORMULAE+=("$pkg")
done < <(grep -v '^\s*#' "$DIR/Formulae" | grep -v '^\s*$')

CASKS=()
while IFS= read -r pkg; do
    CASKS+=("$pkg")
done < <(grep -v '^\s*#' "$DIR/Casks" | grep -v '^\s*$')

install_packages "${FORMULAE[@]}"
install_packages --cask "${CASKS[@]}"

brew cleanup
