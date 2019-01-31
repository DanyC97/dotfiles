#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Terminal\n\n"

execute "gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 12'" \
    "Change font size"

profile=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
palette="['#070736364242','#D3D301010202','#858599990000','#B5B589890000','#26268B8BD2D2','#D3D336368282','#2A2AA1A19898','#EEEEE8E8D5D5','#00002B2B3636','#CBCB4B4B1616','#58586E6E7575','#65657B7B8383','#838394949696','#6C6C7171C4C4','#9393A1A1A1A1','#FDFDF6F6E3E3']"
fg_color="#65657B7B8383"
bg_color="#00002B2B3636"

execute "gsettings set 'org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/' background-color \"${bg_color}\" && \
        gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ foreground-color \"${fg_color}\" && \
        gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ palette \"${palette}\" && \
        gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ use-theme-colors false && \
        gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ bold-color-same-as-fg false" \
    "Set custom terminal theme"
