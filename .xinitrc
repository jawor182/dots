#!/bin/bash
~/.config/screenlayout/screen.sh
# systemctl --user start xdg-desktop-portal
systemctl --user start xdg-desktop-portal-gtk
# systemctl --user start xdg-desktop-portal-gnome
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_STYLE_OVERRIDE=Adwaita:dark
export GTK_THEME=adw-gtk3-dark
export GTK_ICON_THEME="Papirus-Dark"
export XDG_CURRENT_DESKTOP=DWM
export XDG_SESSION_TYPE=x11
export DISPLAY=:0
nm-applet &
blueman-applet &
# megasync -b &
picom -b &
slstatus &
dunst &
nitrogen --restore &

setxkbmap -layout pl
xrdb -merge ~/.Xresources
dbus-update-activation-environment --all
exec dwm 

