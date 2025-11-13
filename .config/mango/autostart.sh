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
    timeout 180 'brightnessctl -sd rgb:kbd_backlight set 0' \
        resume 'brightnessctl -rd rgb:kbd_backlight' \
    timeout 180 'loginctl lock-session && gtklock' \
    timeout 600 'hyprctl dispatch dpms off' \
        resume 'hyprctl dispatch dpms on && brightnessctl -r' \
    timeout 3600 'systemctl suspend' \
    before-sleep 'loginctl lock-session && gtklock' \
    after-resume 'hyprctl dispatch dpms on'
