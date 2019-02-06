#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

brew_install "ShellCheck" "shellcheck"
brew_install "asciinema" "asciinema"
brew_install "gitslave" "gitslave"
brew_install "proxychains-ng" "proxychains-ng"
brew_install "ssh-copy-id" "ssh-copy-id"
brew_install "tree" "tree"
brew_install "wget" "wget"
brew_install "golang" "go"


if [ -d "$HOME/.nvm" ]; then
    brew_install "Yarn" "yarn" "" "" "--without-node"
fi
