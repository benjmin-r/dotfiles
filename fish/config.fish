if [ -e "$TMUX" ]
  set -gx TERM xterm-256color
else
  set -gx TERM screen-256color
end


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ENV vars
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -gx EDITOR vim
set -gx SHELL '/opt/homebrew/bin/fish'
set -gx PATH $PATH ~/bin
set -gx PATH $PATH ~/.tmuxifier/bin
set -gx FZF_DEFAULT_COMMAND 'ag -g ""'
#set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
#set -gx FZF_CTRL_R_OPTS '--bind=ctrl-j:up,ctrl-k:down'



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# source in various configs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source ~/.config/fish/abbr.fish
source ~/.profile


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Make brew completions work
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
eval (/opt/homebrew/bin/brew shellenv)
if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# tmuxifier && tmux
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -gx TMUXIFIER_LAYOUT_PATH ~/.dotfiles/tmuxifier-layouts
eval (tmuxifier init - fish)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# setup pyenv shims ... virtualenv is used as a pyenv plugin
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ... and in case installing pipsi fails
# ~/.pyenv/shims/pip install -U pip pipsi
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# key bindings
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fish_vi_key_bindings
fzf_key_bindings

bind --mode insert --sets-mode default jk backward-char force-repaint

bind -M visual -m insert c kill-selection end-selection force-repaint

bind \cl 'clear; commandline -f repaint'
bind -M insert \cl 'clear; commandline -f repaint'

bind -M insert \cf forward-word

bind \cu backward-kill-line

bind -M default V edit_command
bind -M default K commandline_man

bind --mode insert --sets-mode default jk backward-char force-repaint

bind -M visual -m insert c kill-selection end-selection force-repaint

bind \cl 'clear; commandline -f repaint'
bind -M insert \cl 'clear; commandline -f repaint'

bind -M insert \cf forward-word

bind \cu backward-kill-line

bind -M default V edit_command
bind -M default K commandline_man


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ENV vars
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#set -gx CARGO_BIN_PATH ~/.cargo/bin
#set -gx PATH $PATH $CARGO_BIN_PATH


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# nvm & node
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#set -gx NVM_DIR ~/.nvm


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# chruby & gem_home - a better way to do rbenv & bundler
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#source ~/.config/fish/gem_home.fish

# configure brew installed chruby
#source /usr/local/Cellar/chruby-fish/1.0.0/share/fish/vendor_conf.d/chruby_auto.fish

# install ruby versions with `ruby-build 2.5.1 ~/.rubies/2.5.1`
# `env RUBY_CONFIGURE_OPTS=--with-readline-dir=(brew --prefix readline) ruby-build 2.5.3 ~/.rubies/2.5.3`
# init default ruby version and cross-project gems
### commented out, because it makes fish startup considerably slow 
### and in effect also switching tmux panes from within vim
#chruby 2.5.1
#gem_home ~/.gem_home


