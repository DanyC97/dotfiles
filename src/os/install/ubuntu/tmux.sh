#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   tmux\n\n"

install_package "fonts-powerline" "fonts-powerline"
install_package "tmux" "tmux"

if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
      get_git_repository "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"

fi

execute "tmux new -d -s __noop >/dev/null 2>&1 || true  && \
        tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH "$HOME/.tmux/plugins" && \
        "$HOME"/.tmux/plugins/tpm/bin/install_plugins || true && \
       tmux kill-session -t __noop >/dev/null 2>&1 || true" \
   "tmux plugin manager"


execute "ln -sf $(cd ../../../ && pwd)/tmux/renew_env.sh $HOME/.tmux/renew_env.sh && \
       ln -sf $(cd ../../../ && pwd)/tmux/yank.sh $HOME/.tmux/yank.sh && \
       ln -sf $(cd ../../../ && pwd)/tmux/tmux.remote.conf $HOME/.tmux/tmux.remote.conf" \
   "symlink few tmux files"
