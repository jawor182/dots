#!/bin/sh
~/.config/screenlayout/screen.sh
systemctl --user start xdg-desktop-portal-gtk
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_THEME="Adwaita-Slim-Dark"
export GTK_ICON_THEME="Papirus-Dark"
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
