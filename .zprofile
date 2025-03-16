PATH="$PATH:/$HOME/.local/bin"
PATH="$PATH:/$HOME/.local/bin/statusbar"
export EDITOR="nvim"
export TERMINAL="kitty"
export WLR_RENDERER_ALLOW_SOFTWARE=1
export LIBVA_DRIVER_NAME=nvidia
export XDG_SESSION_TYPE=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM=wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    river
fi
