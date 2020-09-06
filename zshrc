# source aliases and path
source $HOME/.aliases
source $HOME/.path

# neovim
export EDITOR=/usr/bin/nvim

# oh-my-zsh
plugins=(git colored-man-pages taskwarrior z)
export ZSH="/usr/share/oh-my-zsh"
source $ZSH/oh-my-zsh.sh
ZSH_THEME=""
eval $(thefuck --alias)

# starship prompt
eval "$(starship init zsh)"

# syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vi-mode
source ~/.zsh/vi-mode.zsh/vi-mode.zsh

# search w/ arrows
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
