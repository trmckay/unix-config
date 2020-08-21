# source aliases and path
source $HOME/.aliases
source $HOME/.path

# neovim
export EDITOR=/usr/bin/nvim

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
ZSH_THEME=""
plugins=(git colored-man-pages taskwarrior z)

# pure prompt
autoload -U promptinit; promptinit
zstyle :prompt:pure:path color cyan
PURE_PROMPT_SYMBOL="$"
prompt pure

# syntax-highlighting
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vi mode
source ~/.zsh/vi-mode.zsh/vi-mode.zsh
