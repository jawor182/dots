PATH="$PATH:/$HOME/.scripts"
PATH="$PATH:/$HOME/.scripts/statusbar"
export EDITOR="nvim"
export FILES="lfcd"
export BROWSER="librewolf"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec startx
fi
