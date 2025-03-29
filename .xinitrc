#!/bin/sh

. "$HOME/.xprofile"

dbus-update-activation-environment --all
dbus-launch dwm
