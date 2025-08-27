#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
picom -b &
dunst &
lxsession &
playerctld daemon &

dbus-update-activation-environment --all
exec dwm
