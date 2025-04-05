PATH="$PATH:/$HOME/.local/bin"
PATH="$PATH:/$HOME/.local/bin/statusbar"
export EDITOR="nvim"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec uwsm start Hyprland && source "$HOME/.profile"
    # exec startx
fi
