# vim:ft=sh

set -o vi

source ~/.dotfiles/shell/alias
source ~/.dotfiles/shell/env.bash
source ~/.dotfiles/shell/rvm-rbenv.bash
source ~/.dotfiles/shell/functions.bash
source ~/.dotfiles/shell/prompt.bash
source ~/.dotfiles/shell/git-completion.bash
source ~/.dotfiles/shell/pyenv.sh
source ~/.dotfiles/shell/nvm.bash
source ~/.dotfiles/shell/completion.bash
source ~/.dotfiles/shell/pip-completion.bash
source ~/.dotfiles/shell/ssh-completion.bash
source ~/.dotfiles/shell/knife-completion.bash
source ~/.dotfiles/shell/homebrew-completion.bash
source ~/.dotfiles/shell/trousseau-completion.bash
source ~/.dotfiles/shell/scm_breeze.bash
source ~/.dotfiles/shell/travis.bash
source ~/.dotfiles/autoenv/activate.sh

source ~/.dotfiles/shell/ssh-agent.bash
source ~/.dotfiles/shell/gpg.bash

eval "$(tmuxifier init -)"
