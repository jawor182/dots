#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
picom -b &
setbg &
dunst &

dbus-update-activation-environment --all
dbus-launch dwm
