#!/bin/sh

host=$(cat /etc/hostname)

waybar &
swww-daemon &
foot -s &
dunst &
mpd-mpris &
playerctld &
xrdb -m "$XRESOURCES" && echo "Xft.dpi:96" | xrdb -m
wallpaper random &

[ "$host" = "desktop" ] && monitor="DP-1" || monitor="eDP-1"

swayidle -w \
    timeout 180 "brightnessctl -sd rgb:kbd_backlight set 0" \
        resume "brightnessctl -rd rgb:kbd_backlight" \
    timeout 180 "loginctl lock-session & mmsg -d focusmon,$monitor & pidof gtklock || gtklock &" \
    timeout 600 "wlr-dpms off" \
        resume "wlr-dpms on && brightnessctl -r" \
    timeout 3600 "systemctl suspend" \
    lock "mmsg -d focusmon,$monitor & pidof gtklock || gtklock &" \
    before-sleep "loginctl lock-session" \
    after-resume "wlr-dpms on"

