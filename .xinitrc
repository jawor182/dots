#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
picom -b &
nitrogen --restore &

dbus-update-activation-environment --all
dbus-launch dwm
