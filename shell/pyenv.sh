export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
if which pyenv > /dev/null; then
    eval "$(pyenv init -)";
    pyenv virtualenvwrapper
fi
