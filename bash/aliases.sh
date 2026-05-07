alias cd='z'
alias ll='ls -lhF --color=auto --group-directories-first -h'
alias hist='history | fzf'
alias ..='cd ..'
alias ...='cd ../..'
alias edit='$EDITOR'
alias weather='curl wttr.in'
alias pray='node ~/scripts/playertime.js'

# tmux
alias tmuxac='tmux new -A -s'
alias tmuxr='tmux kill-session -t'

# git
alias gst='git status'
alias gcls='git config --list'
alias gcs='git config --system'
alias gcg='git config --global'
alias gcl='git config'
alias gaa='git add .'
alias gcm='git commit -m'
alias gpo='git push origin'
