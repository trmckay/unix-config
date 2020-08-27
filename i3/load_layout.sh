#!/bin/bash
i3-msg "workspace a; append_layout ~/.i3/workspace-0.json"

alacritty --title "startup-terminal" -e "/home/trevor/scripts/motd_script.sh" &

# i3-msg "workspace 3; append_layout ~/.i3/workspace-2.json"
# firefox &

# i3-msg "workspace 4; append_layout ~/.i3/workspace-3.json"
# thunderbird &
