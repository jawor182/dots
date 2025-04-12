#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
picom -b &
setbg &
dunst &
# nitrogen --restore &
lxsession &

dbus-update-activation-environment --all
dbus-launch dwm
