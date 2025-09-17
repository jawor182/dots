PATH="$PATH:/$HOME/.scripts"
PATH="$PATH:/$HOME/.scripts/statusbar"
export EDITOR="nvim"
export FILES="yazii"
export BROWSER="librewolf"
export XDG_CONFIG_HOME="$HOME/.config"
export BEMENU_OPTS="--hp 8 --fb '#282828' --ff '#ebdbb2' --nb '#282828' --nf '#ebdbb2' --tb '#d65d0e' --tf '#282828' --hf '#282828' --hb '#d65d0e' --nf '#ebdbb2' --af '#ebdbb2' --ab '#282828'--fn 'JetBrainsMonoNerdFont 16'"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        # exec startx
        exec dwl-start-session

fi
