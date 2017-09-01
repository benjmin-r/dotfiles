if [ -e "$TMUX" ]
  set -gx TERM xterm-256color
else
  set -gx TERM screen-256color
end

set -gx EDITOR nvim
set fish_key_bindings fish_vi_key_bindings


source ~/.config/fish/abbr.fish
source ~/.config/fish/autoenv.fish
source ~/.config/fish/todotxt.fish


set -gx PATH $PATH ~/bin
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.dotfiles/tmuxifier/bin

set -gx TMUXIFIER_LAYOUT_PATH ~/.dotfiles/tmuxifier-layouts
eval (tmuxifier init - fish)

# setup pyenv shims ... virtualenv is used as a pyenv plugin
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# ... and in case installing pipsi fails
# ~/.pyenv/shims/pip install -U pip pipsi
