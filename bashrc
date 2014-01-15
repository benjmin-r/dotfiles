
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset


hg_ps1() {
        hg prompt "{{branch}}{ at {bookmark}}{status}" 2> /dev/null
}
export PS1="$txtpur\u$txtrst at $txtblu\h$txtrst in $txtgrn\w$txtrst $txtblu \$(__git_ps1 'on (%s)')$txtrst\n$ "


PYTHONBREW_BASHRC="/Users/benjamin/.pythonbrew/etc/bashrc"
if [ -f $PYTHONBREW_BASHRC ]; then
  source $PYTHONBREW_BASHRC
fi


RVM_SCRIPT="$HOME/.rvm/scripts/rvm"
if [ -f $RVM_SCRIPT ]; then
  source $RVM_SCRIPT
fi

if hash rvm 2>/dev/null; then
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
    source $(rvm ruby-1.9.3-p429 do rvm env --path)
fi

# added by travis gem
TRAVIS_SH="/Users/benjamin/.travis/travis.sh"
if  [ -f $TRAVIS_SH ]; then
    source $TRAVIS_SH
fi


upgrade() {
    local retry=5 count=0

    # retry at most $retry times, waiting 1 minute between each try
    while true; do

        # Tell apt-get to only download packages for upgrade, and send 
        # signal 15 (SIGTERM) if it takes more than 10 minutes
        if timeout -15 600 apt-get --assume-yes --download-only upgrade; then
            break
        fi
        if (( count++ == retry )); then
            printf 'Upgrade failed\n' >&2
            return 1
        fi
        sleep 60
    done

    # At this point there should be no more packages to download, so 
    # install them.
    apt-get --assume-yes upgrade
}

# added by travis gem
[ -f /Users/benjamin/.travis/travis.sh ] && source /Users/benjamin/.travis/travis.sh
