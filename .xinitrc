#!/bin/bash
~/.config/screenlayout/screen.sh
systemctl --user start xdg-desktop-portal-gtk
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=Adwaita:dark
export GTK_THEME=adw-gtk3-dark
nm-applet &
blueman-applet &
# megasync -b &
picom -b &
slstatus &
dunst &
nitrogen --restore &

setxkbmap -layout pl
exec dwm 

