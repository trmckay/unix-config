#!/bin/bash

# sets up user dirs per $XDG_USER_DIRS
mkdir -p $HOME/{desktop,downloads,templates,public,documents,music,pictures,videos}

if [ "*scripts*" != $(pwd)]; then
    echo "Excute froms scripts directory!"
    exit 1
fi

# link regular files in home directory
for FILE in $(find .. -maxdepth 1 -type f); do
    ORIGINAL="$HOME/.$FILE"
    rm -f $ORIGINAL
    ln $FILE $ORIGINAL
done

# link config subdirectories
for SUBDIR in $(find ../config -maxdepth 1 -type d); do
    ORIGINAL="$HOME/.config/$SUBDIR"
    rm -rf $ORIGINAL
    ln -s $SUBDIR $ORIGINAL
done

# link loose config files
for FILE in $(find ../config -maxdepth 1 -type f); do
    ORIGINAL="$HOME/.config/$FILE"
    rm -f $ORIGINAL
    ln $FILE $ORIGINAL
done
