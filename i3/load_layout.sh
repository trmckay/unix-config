#!/bin/bash

i3-msg "workspace a; append_layout ~/.i3/secondary.json"
thunderbird &
alacritty --working-directory "/home/trevor" -e /bin/sh -c 'pfetch; ~/scripts/wait-internet.sh; checkupdates; zsh' &
