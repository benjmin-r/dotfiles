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

set -gx EDITOR nvim
set -gx PATH $PATH ~/bin
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH $CARGO_BIN_PATH
set -gx PATH $PATH ~/.dotfiles/tmuxifier/bin

set -gx FZF_DEFAULT_COMMAND 'ag -g ""'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx MATES_DIR ~/.contacts/personal


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# source in various configs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source ~/.config/fish/abbr.fish
source ~/.config/fish/autoenv.fish


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# tmuxifier && tmux
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -gx TMUXIFIER_LAYOUT_PATH ~/.dotfiles/tmuxifier-layouts
eval (tmuxifier init - fish)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# nvm & node
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -gx NVM_DIR ~/.nvm


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# setup pyenv shims ... virtualenv is used as a pyenv plugin
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ... and in case installing pipsi fails
# ~/.pyenv/shims/pip install -U pip pipsi
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# make crystal work
set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
