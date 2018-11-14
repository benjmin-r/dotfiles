#!/bin/bash

brew cask install karabiner-elements iterm2 1password moom qutebrowser google-chrome firefox dropbox
brew cask install sonic-pi supercollider moneymoney bartender tripmode slack
brew cask install arq spotify vlc alfred little-snitch
brew cask install keycastr   # for displaying keystrokes during screencasts or presentations
brew cask install ableton-live-intro
brew cask install cargo
brew install git neovim tmux

brew install --HEAD https://raw.github.com/postmodern/gem_home/master/homebrew/gem_home.rb
brew install fish fzf
brew install ruby-build chruby chruby-fish

echo "Finish fish and fzf install by running `fisher` in a new shell"
echo " ... and run `cargo install mates` for contacts searching"


