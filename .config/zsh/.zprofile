PATH="$PATH:/$HOME/.scripts"
PATH="$PATH:/$HOME/.scripts/statusbar"
export EDITOR="nvim"
export FILES="yazii"
export BROWSER="librewolf"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export XPROFILE="$XDG_CONFIG_HOME/x11/xprofile"
export XRESOURCES="$XDG_CONFIG_HOME/x11/Xresources"
export XAUTHORITY="$XDG_CACHE_HOME/Xauthority"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export ANDROID_HOME="$XDG_DATA_HOME/android"
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export SPOTDL_CONFIG_DIR="$XDG_CONFIG_HOME/spotdl"


if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        # exec startx
        # exec dwl-start-session
        exec uwsm start Hyprland
fi
