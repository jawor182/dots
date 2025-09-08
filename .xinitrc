#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
picom -b &
dunst &
mpd-mpris &
playerctld daemon &

dbus-update-activation-environment --all
exec dwm
