#!/bin/sh
###############################################################################
# NAME:             startwm.sh
#
# AUTHOR:           Ethan D. Twardy <ethan.twardy@gmail.com>
#
# DESCRIPTION:      Simple wrapping script for starting window managers based
#                   on wlroots.
#
# CREATED:          07/22/2022
#
# LAST EDITED:      11/29/2022
###

export XDG_SESSION_TYPE=wayland

start_sway() {
    export XDG_SESSION_DESKTOP=sway
    export XDG_CURRENT_DESKTOP=sway
    systemd-cat --identifier=sway sway
}

start_hyprland() {
    export XDG_SESSION_DESKTOP=hyprland
    export XDG_CURRENT_DESKTOP=hyprland
    systemd-cat --identifier=hyprland Hyprland
}

case "$1" in
    sway)
        start_sway
        ;;
    hyprland)
        start_hyprland
        ;;
    *)
        >&2 printf '%s\n' "Unknown window manager $1"
        RC=1
        ;;
esac

###############################################################################
