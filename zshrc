# source aliases and path
source $HOME/.aliases
source $HOME/.path

# neovim
export EDITOR=/usr/bin/nvim

# oh-my-zsh
plugins=(git colored-man-pages taskwarrior z)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
ZSH_THEME=""

# pure prompt
autoload -U promptinit; promptinit
zstyle :prompt:pure:path color cyan
PURE_PROMPT_SYMBOL="$"
prompt pure

# syntax-highlighting
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
