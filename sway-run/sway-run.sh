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
# LAST EDITED:      07/22/2022
###

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

systemd-cat --identifier=sway sway -d

###############################################################################
