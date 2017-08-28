if [ -e "$TMUX" ]
  set -gx TERM xterm-256color
else
  set -gx TERM screen-256color
end

set -gx EDITOR nvim
set fish_key_bindings fish_vi_key_bindings
source ~/.config/fish/solarized.fish
source ~/.config/fish/abbr.fish
source ~/.config/fish/autoenv.fish
