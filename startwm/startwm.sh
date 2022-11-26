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
# LAST EDITED:      11/26/2022
###

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

start_sway() {
    # This one is a temporary bandaid for the M1, since it seems like sway
    # doesn't play nicely with the simple-framebuffer DRM driver.
    export WLR_NO_HARDWARE_CURSORS=1

    systemd-cat --identifier=sway sway
}

start_hyprland() {
    # Hyprland won't start without this, but it causes terrible visual
    # artifacts while running under sway.
    export WLR_RENDERER_ALLOW_SOFTWARE=1

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
