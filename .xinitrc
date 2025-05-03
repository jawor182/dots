#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
picom -b &
waypaper --random &
# flameshot & 
dunst &
lxsession &

dbus-update-activation-environment --all
while :; do
	dbus-launch ssh-agent dwm
done
