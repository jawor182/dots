#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
xcompmgr &
dunst &
lxsession &

dbus-update-activation-environment --all
exec dwm
