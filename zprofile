# source aliases and path
source $HOME/.aliases
source $HOME/.path

# neovim
export EDITOR=/usr/bin/nvim

# nnn
# export NNN_OPENER=/home/trevor/.config/nnn/plugins/nuke
export NNN_OPENER=""
# export NNN_FILO=/tmp/nnn.fifo
# export NNN_PLUG='o:fzopen;t:preview-tabbed;v:imgvui'

if [[ "$TERM" == "linux" ]]; then
    echo "1) i3    2) awesome    3) bspwm    4) dwm    *) none"
    echo -n "start environment: "

    read -k NUM
    echo ""
    case $NUM in
        "1") xinit i3;;
        "2") xinit awesome;;
        "3") xinit bspwm;;
        "4") xinit dwm;;
        *) neofetch;;
    esac
fi

source $HOME/.bitwarden_session
