PATH="$PATH:/$HOME/.scripts"
PATH="$PATH:/$HOME/.scripts/statusbar"
export EDITOR="nvim"
export FILES="yazii"
export BROWSER="librewolf"
export XDG_CONFIG_HOME="$HOME/.config"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        # exec startx
        exec dwl-start-session

fi
