# source aliases and path
source $HOME/.aliases
source $HOME/.path

# neovim
export EDITOR=/usr/bin/nvim

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
