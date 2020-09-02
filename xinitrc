# NVIDIA SETTINGS
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1"

# MONITOR LAYOUT
xrandr --output DP-3 --mode 1920x1080 --rate 75 --pos 0x0 --rotate left --output HDMI-0 --mode 2560x1440 --rate 60 --pos 1080x147 --rotate normal

# COMPOSITOR
picom -b -c &

# AESTHETICS
nitrogen --restore &
xrdb ~/.Xresources

# SESSION
case $session in
    i3|i3wm           ) exec i3;;
    awesome           ) exec awesome;;
    bspwm             ) exec bspwm;;
    dwm               ) exec dwm;;
    *                 ) exec $1;;
esac
