export PYENV_VERSION="2.7.12"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

if hash pyenv 2> /dev/null; then
    eval "$(pyenv init -)";
    #pyenv virtualenvwrapper
fi

if hash pyenv-sh-virtualenvwrapper 2> /dev/null; then
    eval "$(pyenv virtualenv-init -)"
fi
