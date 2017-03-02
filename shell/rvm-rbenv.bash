RVM_SCRIPT=~/.rvm/scripts/rvm
[ -f $RVM_SCRIPT ] && source $RVM_SCRIPT

export PATH=~/.rbenv/shims:$PATH
if hash rbenv 2> /dev/null; then eval "$(rbenv init -)"; fi
