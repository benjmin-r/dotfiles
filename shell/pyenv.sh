export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
if hash pyenv 2> /dev/null; then
    eval "$(pyenv init -)";
    pyenv virtualenvwrapper
fi

if hash pyenv-sh-virtualenvwrapper 2> /dev/null; then
    eval "$(pyenv-sh-virtualenvwrapper)"
fi
