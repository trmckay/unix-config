echo "start environment:"
echo "0) cancel    1) i3    2) awesome    3) bspwm    4) dwm"
read -n1 NUM
case $NUM in
    "1") xinit i3;;
    "2") xinit awesome;;
    "3") xinit bspwm;;
    "4") xinit dwm
    *) echo "staying in tty";;
esac
