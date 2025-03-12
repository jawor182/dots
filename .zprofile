PATH="$PATH:/$HOME/.local/bin"
PATH="$PATH:/$HOME/.local/bin/statusbar"
export EDITOR="nvim"
export TERMINAL="kitty"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
  # Hyprland
fi
