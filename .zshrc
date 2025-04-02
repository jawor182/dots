# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

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
compinit
_comp_options+=(globdots)# Include hidden files.
autoload -U zsh-autosuggestions
# zmodload zsh/autosuggestions
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


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete


# Variables
alias v="vim"
alias n="nvim"
alias b="btop"
alias y="yay"
alias t="tmux"
alias h="htop"
alias p="sudo pacman"
alias pS="sudo pacman -S"
alias pR="sudo pacman -Rus"
alias yS="yay -Syu"
alias yR="yay -R"
alias yeet="yay -R"
alias update="sudo pacman -Syu && yay -Syu "
alias dev="npm run dev"
alias ls="ls --color"
alias la="ls -la"
alias ll="ls -l"
alias rm="rm -rf"
alias SS="sudo systemctl"
alias SU="systemctl --user"
alias smci="sudo make clean install"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias gst="git status"
alias gcm="git commit -m"
alias gps="git push"
alias gp="git pull"
alias gc="git clone"
alias gad="git add"
alias lshw="sudo lshw"
alias zb="zbarimg"
alias zshupdate="source ~/dots/.zshrc"
alias ff="fastfetch"
alias f="yazi"
alias restow="stow -R ."
alias ta="tmux attach"
alias tn="tmux new"
alias tns="tmux new -s"
alias d="cd ~/dots"
alias db="cd ~/dots/.local/bin"
alias db="cd ~/dots/.local/bin"
alias dbs="cd ~/dots/.local/bin/statusbar"
alias dcn="cd ~/dots/.config"
alias ns="cd ~/new-suckless"
alias nsd="cd ~/new-suckless/dwm"
alias nsdm="cd ~/new-suckless/dmenu"
alias nst="cd ~/new-suckless/st"
alias nsb="cd ~/new-suckless/blocks"
alias C="cd ~/Coding"
alias CS="cd ~/Coding/szkola"
alias ipa="ip a"

# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
# --color=selected-bg:#45475a \
# --multi"

# Custom keybinds
bindkey -s '^S' 'fzf -e\n'
bindkey -s '^F' 'yazi \n'
bindkey -s '^R' 'source ~/dots/.zshrc \n'
bindkey -s '^X' 'source ~/dots/.xprofile \n'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
