#!/bin/sh

. "$HOME/.xprofile"

eval $(dbus-launch --exit-with-session --sh-syntax)
dbus-update-activation-environment --all --systemd DISPLAY XAUTHORITY DBUS_SESSION_BUS_ADDRESS SSH_AUTH_SOCK SSH_AGENT_PID

lxsession &
dwmblocks &
picom &
dunst &
snixembed --fork &
mpd-mpris &

while :; do
    dwm
done
