RVM_SCRIPT=~/.rvm/scripts/rvm
[ -f $RVM_SCRIPT ] && source $RVM_SCRIPT

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
