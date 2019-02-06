#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   GOlang\n\n"


if [ ! -f "$HOME/projects/dotfiles/src/bin/go_installer_linux" ]; then
  download "https://dl.google.com/go/getgo/installer_linux" "$HOME/projects/dotfiles/src/bin/go_installer_linux"

  print_result $? "Download GO installer"
  printf "\n"

  execute "chmod 755 $HOME/projects/dotfiles/src/bin/go_installer_linux" \
      "Make GO installer executable"

else
  print_success "GO installer already downloaded"

fi

if ! cmd_exists "go"; then
  execute "$HOME/projects/dotfiles/src/bin/go_installer_linux"  \
      "Install latest GOlang version"

fi
