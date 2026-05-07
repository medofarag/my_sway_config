# Variables
export EDITOR='nvim'
export VISUAL='nvim'

# bash history enhanced features
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -s histappend

# evales
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(ssh-agent)"

# aliases
source ~/.config/bash/aliases.sh
alias reload='source ~/.bashrc'

# ble.sh
source ~/.local/share/blesh/ble.sh

# functions
source ~/.config/bash/functions.sh

# Automatically added by the Guix install script.
if [ -n "$GUIX_ENVIRONMENT" ]; then
    if [[ $PS1 =~ (.*)"\\$" ]]; then
        PS1="${BASH_REMATCH[1]} [env]\\\$ "
    fi
fi

