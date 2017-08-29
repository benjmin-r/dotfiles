abbr -a g git
abbr -a gc git commit -v
abbr -a gac git commit -v --all
abbr -a gca git commit -v --amend
abbr -a gaca git commit -v --amend --all
abbr -a ga git add
abbr -a gd git diff
abbr -a gdc git diff --cached
abbr -a gco git checkout
abbr -a gr git remote
abbr -a grh git reset HEAD
abbr -a grhh git reset HEAD --hard
abbr -a gl git lgs

function git
  # inspired by thoughtbot/dotfiles
  if count $argv > /dev/null # alternative: set -q argv
    command git $argv
  else
    command git status -sb
  end
end
