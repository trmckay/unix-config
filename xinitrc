nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
xrandr --output DP-1 --mode 1920x1080 --rate 75 --pos 0x0 --rotate left --output HDMI-0 --mode 2560x1440 --rate 60 --pos 1080x147 --rotate normal
picom -b -c &
nitrogen --restore &
xrdb ~/.Xresources
xautolock -time 5 -locker "i3lock -i /home/trevor/Pictures/wallpapers/mt.jpg" &
exec "i3"
