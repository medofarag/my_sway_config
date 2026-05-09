# Variables
export EDITOR='nvim'
export VISUAL='nvim'
export QT_QPA_PLATFORMTHEME=qt5ct

# bash history enhanced features
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -s histappend

# evales
eval "$(zoxide init bash)"
eval "$(ssh-agent)"

# aliases
source ~/.config/bash/aliases.sh
alias reload='source ~/.bashrc'

# ble.sh
source ~/.local/share/blesh/ble.sh

# functions
source ~/.config/bash/functions.sh
