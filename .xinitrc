#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
picom &
dunst &
lxsession &

dbus-update-activation-environment --all
exec dwm
