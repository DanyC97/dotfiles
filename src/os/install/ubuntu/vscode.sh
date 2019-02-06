#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Visual Studio Code\n\n"

if ! package_is_installed "code"; then

    add_key "https://packages.microsoft.com/keys/microsoft.asc" \
        || print_error "VSCode (add key)"

    add_to_source_list "https://packages.microsoft.com/repos/vscode stable main" "vscode.list" \
        || print_error "VSCode (add to package resource list)"

    update &> /dev/null \
        || print_error "VSCode (resync package index files)"

    install_package "Visual Studio Code" "code"

fi
