if [ -e "$TMUX" ]
  set -gx TERM xterm-256color
else
  set -gx TERM screen-256color
end

set fish_key_bindings fish_vi_key_bindings


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ENV vars
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -gx CARGO_BIN_PATH ~/.cargo/bin

set -gx EDITOR vim
set -gx PATH $PATH ~/bin
set -gx PATH $PATH $CARGO_BIN_PATH
set -gx PATH $PATH ~/.dotfiles/tmuxifier/bin

set -gx FZF_DEFAULT_COMMAND 'ag -g ""'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx MATES_DIR ~/.contacts/personal


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# source in various configs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source ~/.config/fish/abbr.fish


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# tmuxifier && tmux
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -gx TMUXIFIER_LAYOUT_PATH ~/.dotfiles/tmuxifier-layouts
eval (tmuxifier init - fish)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# nvm & node
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -gx NVM_DIR ~/.nvm


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# chruby & gem_home - a better way to do rbenv & bundler
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source ~/.config/fish/gem_home.fish

# configure brew installed chruby
source /usr/local/Cellar/chruby-fish/0.8.2/share/chruby/chruby.fish

# install ruby versions with `ruby-build 2.5.1 ~/.rubies/2.5.1`
# `env RUBY_CONFIGURE_OPTS=--with-readline-dir=(brew --prefix readline) ruby-build 2.5.3 ~/.rubies/2.5.3`
# init default ruby version and cross-project gems
### commented out, because it makes fish startup considerably slow 
### and in effect also switching tmux panes from within vim
#chruby 2.5.1
#gem_home ~/.gem_home


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# setup pyenv shims ... virtualenv is used as a pyenv plugin
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ... and in case installing pipsi fails
# ~/.pyenv/shims/pip install -U pip pipsi
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# make crystal lang work
#set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
