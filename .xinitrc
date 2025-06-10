#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
# picom -b &
fastcompmgr &
wallpaper random &
dunst &
lxsession &

dbus-update-activation-environment --all
while :; do
	dbus-launch ssh-agent dwm
done
