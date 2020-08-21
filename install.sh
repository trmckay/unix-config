#!/bin/bash

# install minimum packages
sudo pacman -S neovim zsh git curl tmux i3 rxvt-unicode alacritty picom rofi python3

# set up zsh and plugins
mkdir $HOME/.zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh-syntax-highlighting
git clone https://github.com/sindresorhus/pure.git $HOME/.zsh/pure
git clone --depth=1 https://github.com/woefe/vi-mode.zsh $HOME/.zsh/vi-mode.zsh
chsh -s $(which zsh)

# install fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
(cd nerd-fonts; chmod +x install.sh; ./install.sh Meslo)
rm -rf nerd-fonts 

# link each file to home folder
for FILE in *; do
    if [ "$FILE" != ".git" ]; then 
        ln -sf $FILE $HOME/.$FILE
    fi 
done

# install neovim plugins
pip3 install pynvim
nvim -c PlugInstall -c UpdateRemotePlugins
