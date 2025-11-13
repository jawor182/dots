#!/bin/sh

waybar &
swww-daemon &
foot -s &
dunst &
mpd-mpris &
playerctld &
screen &
xrdb -m "$XRESOURCES" && echo "Xft.dpi:96" | xrdb -m
sleep 0.5 && wallpaper random &

swayidle -w \
    timeout 500 "wlr-dpms off && gtklock &" \
    resume "wlr-dpms on"
