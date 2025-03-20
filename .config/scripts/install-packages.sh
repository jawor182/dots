#!/bin/bash

apps=(
alacritty
calibre
dconf-editor
discord
firefox
flameshot
keepassxc
kitty
ly
lxappearance
neovim
nautilus
nitrogen
qt5ct
obsidian
solaar
thunderbird
vim
virt-manager
virt-viewer
zsh
)
libs=(
dash
checkbashisms
ntfs-3g    
cargo
cups 
cups-pdf
cups-filters
system-config-printer
gutenprint
foomatin-db-gutenprint-ppds
clang
cups
dunst
dnsmasq
ffmpeg
fish
go
gvfs-afc
ifuse
iftop
iotop
libimobiledevice
libvirt
lua
lm_sensors
luarocks
mokutil
man-db
man-pages
nodejs
npm
openbsd-netcat
pamixer
picom
playerctl
pciutils
usbutils
php
pnpm
powertop
protobuf
pulsemixer
python
qemu-full
ripgrep
ruby
rust
syncthing
starship
tlp
usbmuxd
usbutils
unzip
wl-clipboard
xclip
xorg
yarn
zathura-pdf-mupdf
zbar
zsh-autosuggestions
zsh-completions
zsh-syntax-highlighting
xsecurelock
)
cli=(
bat
btop
inxi
fastfetch
fzf
figlet
cowsay
lshw
github-cli
speedtest-cli
lshw
htop
jq
neofetch
pulsemixer
stow
tldr
yazi
zathura
)
other=(
adw-gtk-theme
adwaita-icon-theme
noto-fonts-emoji
noto-fonts
tf-dejavu 
ttf-font-awesome 
ttf-hanazono 
ttf-jetbrains-mono-nerd 
ttf-liberation 
ttf-nerd-fonts-symbols 
ttf-nerd-fonts-symbols-common 
ttf-sazanami 
papirus-icon-theme
kvantum
kvantum-qt5
)
yay_stuff=(
cava
brave-bin
adwaita-slim-gtk-theme
bluetuith-bin
adwaita-qt5
kvantum-theme-arc
kvantum-theme-libadwaita
)
# flatpaks=(
# "com.github.tchx84.Flatseal"
# "com.jeffser.Alpaca"
# "com.mattjakeman.ExtensionManager"
# "com.rafaelmardojai.Blanket"
# "com.spotify.Client"
# "com.visualstudio.code"
# "com.usebottles.bottles"
# "org.gnome.World.PikaBackup"
# )

install_packages() {
    local category=$1
    shift
    local packages=("$@")
    echo "Installing $category ..."
    sudo pacman -Syu "${packages[@]}"
}
install_packages_aur() {
    local category=$1
    shift
    local packages=("$@")
    echo "Installing $category ..."
    yay -Syu "${packages[@]}"
}
# install_packages_flatpak() {
#     local category=$1
#     shift
#     local packages=("$@")
#     echo "Installing $category ..."
#     flatpak install -y  "${packages[@]}"
# }
install_packages "apps" "${apps[@]}"
install_packages "libs" "${libs[@]}"
install_packages "cli" "${cli[@]}"
install_packages "other" "${other[@]}"
install_packages_aur "yay" "${yay_stuff[@]}"
# install_packages_flatpak "flatpaks" "${flatpaks[@]}"
