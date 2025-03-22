#!/bin/sh
~/.config/screenlayout/screen.sh
systemctl --user start xdg-desktop-portal-gtk
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
export QT_QPA_PLATFORMTHEME="gtk2"
export XDG_CURRENT_DESKTOP=DWM
export XDG_SESSION_TYPE=x11
export ELECTRON_FORCE_DARK_MODE=true
export DISPLAY=:0
picom -b &
dunst &
nitrogen --restore &
systemctl --user start syncthing
setxkbmap -layout pl
xrdb -merge ~/.Xresources
xset r rate 300 50
dbus-update-activation-environment --all
dwmblocks &
exec dwm
