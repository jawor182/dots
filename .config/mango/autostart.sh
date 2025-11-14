#!/bin/sh

waybar &
swww-daemon &
foot -s &
dunst &
mpd-mpris &
playerctld &
xrdb -m "$XRESOURCES" && echo "Xft.dpi:96" | xrdb -m
wallpaper random &

swayidle -w \
    timeout 180 'brightnessctl -sd rgb:kbd_backlight set 0' \
        resume 'brightnessctl -rd rgb:kbd_backlight' \
    timeout 180 'loginctl lock-session & gtklock &' \
    timeout 600 'wlr-dpms off' \
        resume 'wlr-dpms on && brightnessctl -r' \
    timeout 3600 'systemctl suspend' \
    lock 'pidof gtklock || gtklock' \
    before-sleep 'loginctl lock-session' \
    after-resume 'wlr-dpms on'

