#!/bin/sh

. "$HOME/.xprofile"

# Apps autostart
dwmblocks &
picom &
dunst &
lxsession &

while :; do
    exec dwm
done
