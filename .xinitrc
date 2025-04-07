#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
picom -b &
# nitrogen --restore &
dunst &

dbus-update-activation-environment --all
dbus-launch dwm
