# don't start an Xserver if in tmux
if [[ "$TERM" != "tmux-256color" ]]; then 
    echo -n "startx in "
    for NUM in 3 2 1; do
        echo -n "$NUM..."
        sleep 1
    done
    startx
fi
