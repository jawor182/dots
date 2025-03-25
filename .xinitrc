#!/bin/sh
screen
systemctl --user start xdg-desktop-portal-gtk
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
export QT_QPA_PLATFORMTHEME="gtk2"
export XDG_CURRENT_DESKTOP=DWM
export XDG_SESSION_TYPE=x11
export ELECTRON_FORCE_DARK_MODE=true
export ELECTRON_FORCE_DEVICE_SCALE_FACTOR=1.25
export GDK_SCALE=1.25
# export GDK_DPI_SCALE=1.25
export QT_SCALE_FACTOR=1.25
export DISPLAY=:0
picom -b &
dunst &
nitrogen --restore &
systemctl --user start syncthing
setxkbmap -layout pl
xrdb -merge ~/.Xresources
xset r rate 300 100
dwmblocks &
dbus-update-activation-environment --all
dbus-launch  dwm
