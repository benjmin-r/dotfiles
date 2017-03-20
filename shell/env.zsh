export CLICOLOR=1
export EDITOR=vi
export TZ='Europe/Berlin'
export LESS='-R -F -X'

export WORKON_HOME=~/VirtualEnvs
export PIP_REQUIRE_VIRTUALENV=false
export PIP_RESPECT_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
export TMUXIFIER_LAYOUT_PATH=$HOME/.dotfiles/tmuxifier-layouts
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export GOPATH=$HOME/go

export PATH=~/bin:~/local-bin:$GOPATH/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:~/.local/bin:~/.dotfiles/tmuxifier/bin:$PATH
