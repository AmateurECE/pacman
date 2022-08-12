#!/bin/sh
###############################################################################
# NAME:             sway-run.sh
#
# AUTHOR:           Ethan D. Twardy <ethan.twardy@gmail.com>
#
# DESCRIPTION:      Wrapper script for sway window manager
#
# CREATED:          07/22/2022
#
# LAST EDITED:      08/12/2022
###

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

# This one is a temporary bandaid for the M1, since it seems like sway doesn't
# play nicely with the simple-framebuffer DRM driver.
export WLR_NO_HARDWARE_CURSORS=1

systemd-cat --identifier=sway sway

###############################################################################
