# nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
picom -b -c &
# nitrogen --restore &
xrdb ~/.Xresources
# xautolock -time 5 -locker "i3lock -i /home/trevor/Pictures/wallpapers/space-3-cropped.jpg" &
exec "i3"

