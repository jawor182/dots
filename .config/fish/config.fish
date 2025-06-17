if status is-interactive
    function fish_mode_prompt; end
    function fish_greeting; end
    function fish_user_key_bindings
        fish_default_key_bindings -M insert
        fish_vi_key_bindings --no-erase insert # or other modes you use
    end
    function fish_title
        set -q argv[1]
        echo "$argv" (fish_prompt_pwd_dir_length=255 prompt_pwd)
    end
    function fish_prompt
        set_color red --bold
        printf "["
        set_color yellow
        printf "%s" "$USER"
        set_color green
        printf "@"
        set_color blue
        printf "%s" "$hostname"
        set_color magenta
        printf " %s" (prompt_pwd)
        set_color red --bold
        printf "]"
        set_color normal
        printf "\$ "
        set_color normal
    end 
    function yazii
	    set tmp (mktemp -t "yazi-cwd.XXXXXX")
	    yazi $argv --cwd-file="$tmp"
    	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
    	    builtin cd -- "$cwd"
            commandline -f repaint
        end
    	rm -f -- "$tmp"
    end
    set -gx fish_prompt_pwd_dir_length 255
    set -x MANPAGER "$EDITOR +Man!"
    set -Ux FZF_DEFAULT_OPTS "\
    --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
    --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
    --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
    --color=selected-bg:#45475A \
    --color=border:#313244,label:#CDD6F4"

    bind -M insert j 'commandline -P; and down-or-search; or commandline -i j'
    bind -M insert k 'commandline -P; and up-or-search; or commandline -i k'
    bind -M insert h 'commandline -P; and commandline -f backward-char; or commandline -i h'
    bind -M insert l 'commandline -P; and commandline -f forward-char; or commandline -i l'
    bind -M insert ctrl-f "commandline '$FILES'; commandline -f execute"
    # bind -M insert ctrl-x "commandline 'xset r rate 300 60 ; screen ; xrdb -m ~/.Xresources'; commandline -f execute"
    bind -M insert ctrl-x "commandline 'xset r rate 300 60 ; xrdb -m ~/.Xresources'; commandline -f execute"
    bind -M insert ctrl-r "commandline 'source $XDG_CONFIG_HOME/fish/config.fish'; commandline -f execute"

    alias grep "grep --color -i"
    alias update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg" 
    alias ls "ls --color -hN"
    alias lshw "sudo lshw"
    alias restow "stow -R ."
    alias rm "rm -rf"
    alias echo "echo -e"

    abbr p "sudo pacman"
    abbr pS "sudo pacman -S" 
    abbr pR "sudo pacman -R"
    abbr y "yay"
    abbr yS "yay -S"
    abbr yR "yay -R"
    abbr f "$FILES"
    abbr n "nvim"
    abbr v "vim"
    abbr sn "sudoedit"
    abbr t "tmux"
    abbr tn "tmux new" 
    abbr ta "tmux attach"  
    abbr update "sudo pacman -Syu && yay -Syu"
    abbr b "btop"
    abbr h "htop"
    abbr ff "fastfetch"
    abbr zb "zbarimg"
    abbr SS "sudo systemctl"
    abbr SU "systemctl --user"
    abbr smci "sudo make clean install"
    abbr dev "npm run dev"
    abbr gad "git add"
    abbr gc "git clone"
    abbr gcm "git commit -m"
    abbr gp "git pull"
    abbr gps "git push"
    abbr gst "git status"
    abbr rr "cd ~/repos"
    abbr c "cd ~/dots"
    abbr cff "$EDITOR ~/dots/.config/fish/config.fish"
    abbr cfk "$EDITOR ~/dots/.config/kitty/kitty.conf"
    abbr cfh "$EDITOR ~/dots/.config/hypr/hyprland.conf"
    abbr cfz "$EDITOR ~/dots/.zshrc"
    abbr cs "cd ~/dots/.scripts"
    abbr css "cd ~/dots/.scripts/statusbar"
    abbr cf "cd ~/dots/.config"
    abbr cfn "cd ~/dots/.config/nvim"
    abbr cfw "cd ~/dots/.config/waybar"
    abbr cfy "cd ~/dots/.config/yazi"
    abbr ns "cd ~/new-suckless"
    abbr nsb "cd ~/new-suckless/blocks"
    abbr nsd "cd ~/new-suckless/dwm"
    abbr nsdm "cd ~/new-suckless/dmenu"
    abbr nst "cd ~/new-suckless/st"
    abbr nsn "cd ~/new-suckless/nsxiv"
    abbr d "cd ~/dox"
    abbr dn "cd ~/dox/notes"
    abbr dp "cd ~/dox/pix"
    abbr ds "cd ~/dox/szkola"
    abbr ww "cd ~/walls"
    abbr xcopy "xclip -selection clipboard"

    if set -q KITTY_INSTALLATION_DIR
        set --global KITTY_SHELL_INTEGRATION enabled
        source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
        set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
    end
end
if status is-login
    set -gx PATH "$PATH:/$HOME/.scripts"
    set -gx PATH "$PATH:/$HOME/.scripts/statusbar"
    set -gx EDITOR "nvim"
    set -gx FILES "yazii"
    if test -z "$DISPLAY" -a "$XDG_VTNR" = "1"
        # exec uwsm start Hyprland
        exec startx
    end
end
