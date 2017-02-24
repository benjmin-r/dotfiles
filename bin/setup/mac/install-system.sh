#!/bin/bash

./brews.sh
./brew-casks.sh
./brew-devenv.sh

source ~/bin/setup/recipe-dotfiles
install_dotfiles
