export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
if which pyenv > /dev/null; then
    eval "$(pyenv init -)";
    pyenv virtualenvwrapper
fi

if which pyenv-sh-virtualenvwrapper > /dev/null; then
    eval "$(pyenv-sh-virtualenvwrapper)"
fi
