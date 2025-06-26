#            _              
#   _______| |__  _ __ ___ 
#  |_  / __| '_ \| '__/ __|
#   / /\__ \ | | | | | (__ 
#  /___|___/_| |_|_|  \___|
#  
# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

export MANPAGER="$EDITOR +Man!"

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.zsh_history"
setopt share_history
setopt inc_append_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
compinit -d "~/.local/.zcompdump"
_comp_options+=(globdots)
autoload -U zsh-autosuggestions
# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

function yazii() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

# Aliases
# ─── EDITORS ──────────────────────────────────────────────
alias v="vim"
alias n="nvim"
alias sn="sudoedit"

# ─── PACKAGE MANAGEMENT
alias p="sudo pacman"
alias pQ="sudo pacman -Q"
alias pQS="sudo pacman -Qs"
alias pR="sudo pacman -Rus"
alias pS="sudo pacman -S"
alias pSS="sudo pacman -Ss"
alias y="yay"
alias yR="yay -R"
alias yS="yay -S"
alias ySS="yay -Ss"
alias yeet="yay -Rus"

# ─── SYSTEM UPDATES ───────────────────────────────────────
alias update="sudo pacman -Syu && yay -Syu"

# ─── SYSTEM MONITORING & INFO ─────────────────────────────
alias b="btop"
alias h="htop"
alias ff="fastfetch"
alias grep="grep --color -i"
alias ipa="ip a"
alias lshw="sudo lshw"
alias zb="zbarimg"

# ─── SYSTEM CONTROL ───────────────────────────────────────
alias cm="cmatrix"
alias pp="pipes.sh"
alias smci="sudo make clean install"
alias SS="sudo systemctl"
alias SU="systemctl --user"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# ─── GIT WORKFLOW ─────────────────────────────────────────
alias gad="git add"
alias gc="git clone"
alias gcm="git commit -m"
alias gp="git pull"
alias gps="git push"
alias gst="git status"

# ─── NAVIGATION & DOTFILES ────────────────────────────────
alias rr="cd ~/repos"
alias c="cd ~/dots"
alias cff="$EDITOR ~/dots/.config/foot/foot.ini"
alias cfd="$EDITOR ~/dots/.config/dunst/dunstrc"
alias cfh="$EDITOR ~/dots/.config/hypr/hyprland.conf"
alias cfp="$EDITOR ~/dots/.config/picom/picom.conf"
alias cfr="$EDITOR ~/dots/.config/rofi/config.rasi"
alias cft="$EDITOR ~/dots/.config/tmux/tmux.conf"
alias cfz="$EDITOR ~/dots/.zshrc"
alias cs="cd ~/dots/.scripts"
alias css="cd ~/dots/.scripts/statusbar"
alias cf="cd ~/dots/.config"
alias cfn="cd ~/dots/.config/nvim"
alias cfw="cd ~/dots/.config/waybar"
alias cfy="cd ~/dots/.config/yazi"
alias ns="cd ~/new-suckless"
alias nsb="cd ~/new-suckless/blocks"
alias nsn="cd ~/new-suckless/nsxiv/"
alias nsd="cd ~/new-suckless/dwm"
alias nsdm="cd ~/new-suckless/dmenu"
alias nst="cd ~/new-suckless/st"
alias d="cd ~/dox"
alias dn="cd ~/dox/notes"
alias dp="cd ~/dox/pix"
alias ds="cd ~/dox/szkola"
alias ww="cd ~/walls"
alias f="$FILES"

# ─── SHELL & ENVIRONMENT ──────────────────────────────────
alias la="ls -la"
alias ll="ls -l"
alias ls="ls --color -hN"
alias rm="rm -rf"
alias restow="stow -R ."
alias zshupdate="source ~/dots/.zshrc"
alias xcopy="xclip -selection clipboard"

# ─── TMUX SESSIONS ────────────────────────────────────────
alias t="tmux"
alias ta="tmux attach"
alias tn="tmux new"
alias tns="tmux new -s"

# ─── MISCELLANEOUS ────────────────────────────────────────
alias dev="npm run dev"
alias wi="wikiman"
alias wia="wikiman -s arch"

# Catppuccin
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
# --color=selected-bg:#45475a \
# --color=border:#313244,label:#cdd6f4"

# Gruvbox
# Gruvbox
export FZF_DEFAULT_OPTS=" \
    --color=fg:#ebdbb2,bg:#282828,hl:#b16286 \
    --color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b \
    --color=info:#d65d0e,prompt:#458588,pointer:#fe8019 \
    --color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f"



# Custom keybinds
bindkey -s '^F' '$FILES \n'
bindkey -s '^R' 'source ~/dots/.zshrc \n'
bindkey -s '^X' 'xset r rate 300 60 ; xrdb -m ~/.Xresources\n'

export PATH="/home/jawor/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/jawor/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
