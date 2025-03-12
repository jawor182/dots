#!/bin/bash

apps=(
alacritty
blueman
calibre
dconf-editor
discord
firefox
flameshot
ghostty
keepassxc
kitty
ly
lxappearance
mission-center
neovim
nitrogen
nwg-look
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
ntfs-3g    
cargo
clang
cups
deno
dunst
dnsmasq
ffmpeg
fish
go
ifuse
iftop
iotop
libimobiledevice
libvirt
lua
lm_sensors
luarocks
man-db
man-pages
nodejs
npm
openbsd-netcat
pamixer
picom
playerctl
php
pnpm
powertop
# power-profiles-daemon
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
zathura-pdf-poppler
zbar
zsh-autosuggestions
zsh-completions
zsh-syntax-highlighting
)
cli=(
bat
btop
bluetui
fastfetch
fzf
htop
jq
neofetch
pulsemixer
stow
yazi
zathura
)
other=(
adw-gtk-theme
adwaita-icon-theme
ttf-jetbrains-mono-nerd
noto-fonts-emoji
papirus-icon-theme
)
yay_stuff=(
cava
brave-bin
adwaita-slim-gtk-theme
bluetuith-bin
librewolf-bin
vscodium-bin
vscodium-bin-marketplace
adwaita-qt5
)
flatpaks=(
"com.github.tchx84.Flatseal"
"com.jeffser.Alpaca"
"com.mattjakeman.ExtensionManager"
"com.rafaelmardojai.Blanket"
"com.spotify.Client"
"com.visualstudio.code"
"com.usebottles.bottles"
"org.gnome.World.PikaBackup"
)

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
install_packages_flatpak() {
    local category=$1
    shift
    local packages=("$@")
    echo "Installing $category ..."
    flatpak install -y  "${packages[@]}"
}
install_packages "apps" "${apps[@]}"
install_packages "libs" "${libs[@]}"
install_packages "cli" "${cli[@]}"
install_packages "other" "${other[@]}"
install_packages_aur "yay" "${yay_stuff[@]}"
install_packages_flatpak "flatpaks" "${flatpaks[@]}"
