echo "0) none    1) i3    2) awesome    3) bspwm    4) dwm"
echo -n "start environment: "

read -k NUM
echo ""
case $NUM in
    "1") xinit i3;;
    "2") xinit awesome;;
    "3") xinit bspwm;;
    "4") xinit dwm;;
    *) echo "staying in tty";;
esac
