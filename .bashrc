# Variables
export EDITOR='nvim'
export VISUAL='nvim'
export QT_QPA_PLATFORMTHEME=qt6ct

# bash history enhanced features
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -s histappend

# aliases
source ~/.config/bash/aliases.sh
alias reload='source ~/.bashrc'

# ble.sh
source ~/.local/share/blesh/ble.sh

# functions
source ~/.config/bash/functions.sh

# evales
eval "$(ssh-agent)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
