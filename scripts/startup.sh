#!/bin/bash

tmux new-session -d -s startup '/home/trevor/scripts/motd_script.sh'
tmux attach-session -d -t startup
