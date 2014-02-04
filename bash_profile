alias l='ls -hal -G'
alias gti='git'
alias gitp='git-smart-pull'
alias gitl='git-smart-log'
alias pd=pushd
alias composer="php composer.phar"
alias mutt-personal='mutt -n -e "source ~/.mutt/accounts/ambestengestern"'
alias mutt-work='mutt -n -e "source ~/.mutt/accounts/work"'


export EDITOR=vi

export PIP_REQUIRE_VIRTUALENV=false
export PIP_RESPECT_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
export TMUXIFIER_LAYOUT_PATH=$HOME/.dotfiles/tmuxifier-layouts

export PATH=/usr/local/share/npm/bin:~/bin:~/.dotfiles/tmuxifier/bin:$PATH

source ~/.dotfiles/autoenv/activate.sh

export WORKON_HOME=~/VirtualEnvs
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh 
fi

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

function pless {
  pygmentize $1 | less -r
}

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
  eval `$SSHAGENT $SSHAGENTARGS`
  trap "kill $SSH_AGENT_PID" 0
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# rbenv completion ... via homebrew
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end


alias highlightrb='pbpaste | pygmentize -f rtf -l ruby -O style=solarized | pbcopy'
alias highlightpy='pbpaste | pygmentize -f rtf -l python -O style=solarized | pbcopy'
alias highlightjava='pbpaste | pygmentize -f rtf -l java -O style=solarized | pbcopy'
