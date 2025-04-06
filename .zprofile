PATH="$PATH:/$HOME/.local/bin"
PATH="$PATH:/$HOME/.local/bin/statusbar"
export EDITOR="nvim"
export FILES="yazi"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    # exec uwsm start Hyprland 
    exec startx
fi
