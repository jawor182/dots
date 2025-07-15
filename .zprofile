PATH="$PATH:/$HOME/.scripts"
PATH="$PATH:/$HOME/.scripts/statusbar"
export EDITOR="nvim"
export FILES="yazii"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec uwsm start Hyprland 
fi
