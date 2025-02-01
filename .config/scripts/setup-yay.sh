#!/bin/bash

git clone https://aur.archlinux.org/yay ~/yay

cd "$HOME/yay" || exit 

makepkg -si 

