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

# pure prompt
# autoload -U promptinit; promptinit
# zstyle :prompt:pure:path color cyan
# PURE_PROMPT_SYMBOL="$"
# prompt pure

# starship prompt
eval "$(starship init zsh)"

# syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vi mode
bindkey -v
export KEYTIMEOUT=1

# change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}
