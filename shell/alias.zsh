alias l='ls -hal'
alias pd=pushd
alias vi='vim'
alias tmux-attach="tmux attach-session -t 0"
alias gq='goobook query'
alias ghi='TERM=xterm-256color ghi'

alias tx='tmuxifier'

alias flush-gpg-pass='gpgconf --reload gpg-agent'
alias flush-gpg-agent='pgrkill gpg && eval $(gpg-agent --daemon)'

alias kb="keybase --standalone"

alias gti='git'
alias gitp='git-smart-pull'
alias gitl='git-smart-log'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit -v'
alias gac='git commit -v --all'
alias gca='git commit -v --amend'
alias gpr='git pull-request'

alias highlightrb='pbpaste | pygmentize -f rtf -l ruby -O style=solarized | pbcopy'
alias highlightpy='pbpaste | pygmentize -f rtf -l python -O style=solarized | pbcopy'
alias highlightjava='pbpaste | pygmentize -f rtf -l java -O style=solarized | pbcopy'
alias start-postgres='postgres -D /usr/local/var/postgres'

alias sync-contacts="PYTHONPATH='' vdirsyncer sync && mates index"
