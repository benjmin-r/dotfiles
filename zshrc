# Path to your oh-my-zsh installation.
export ZSH=/Users/benjamin/.dotfiles/oh-my-zsh

ZSH_THEME="benjamin"

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# ENABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(rails autoenv rbenv vi-mode heroku httpie autojump tig)

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8
export SSH_KEY_PATH="~/.ssh/id_rsa"

source ~/.dotfiles/shell/env.zsh
source ~/.dotfiles/shell/nvm.zsh
source ~/.dotfiles/shell/pyenv.sh
source ~/.dotfiles/shell/rbenv.sh
source ~/.dotfiles/shell/alias.zsh
source ~/.dotfiles/shell/functions.sh
source ~/.dotfiles/shell/scm_breeze.sh
source ~/.dotfiles/shell/tmuxifier.sh

bindkey -M viins 'jk' vi-cmd-mode
