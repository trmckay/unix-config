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

# nnn cd on quit
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
