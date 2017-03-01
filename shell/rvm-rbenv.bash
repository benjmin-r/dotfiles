RVM_SCRIPT=~/.rvm/scripts/rvm
[ -f $RVM_SCRIPT ] && source $RVM_SCRIPT

if hash rbenv 2> /dev/null; then eval "$(rbenv init -)"; fi

export PATH=~/.rbenv/shims:$PATH
source ~/.rbenv/completions/rbenv.bash
