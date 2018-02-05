set nocompatible      " Don't force vi compatibility

call plug#begin('~/.neovim/plugged')
    Plug 'frankier/neovim-colors-solarized-truecolor-only'
    Plug 'itchyny/lightline.vim'
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}
    Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}
    Plug 'tomtom/tlib_vim'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-surround'
    Plug 'ervandew/supertab'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'benmills/vimux'
    Plug 'vim-ruby/vim-ruby'
    Plug 'stephpy/vim-yaml'
    Plug 'airblade/vim-gitgutter'
    Plug 'garbas/vim-snipmate'
    Plug 'kchmck/vim-coffee-script'
    Plug 'mileszs/ack.vim', { 'on': ['Ack', 'Ack!'] }
    Plug 'jiangmiao/auto-pairs'
    Plug 'IN3D/vim-raml'
    Plug 'qpkorr/vim-bufkill'
    Plug 'tpope/vim-endwise'
    Plug 'skalnik/vim-vroom'
    Plug 'sunaku/vim-ruby-minitest'
    Plug 'dag/vim-fish'
    Plug 'ecomba/vim-ruby-refactoring'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'  " Tell fzf plugin to use homebrew installed fzf
    Plug 'benjmin-r/vim-i18n'
    Plug 'tpope/vim-commentary'
    Plug 'w0rp/ale'
    Plug 'jlanzarotta/bufexplorer', { 'on': ['BufExplorer'] }
    Plug 'junegunn/goyo.vim', { 'on': ['Goyo'] }
    Plug 'dracula/vim', { 'on': ['Goyo'] }

    Plug 'dermusikman/sonicpi.vim'

    "Plug 'tpope/vim-fireplace'
    Plug 'tpope/vim-unimpaired'
call plug#end()


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" color scheme
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
behave xterm

set termguicolors
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
set colorcolumn=120


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Keymappings and complex plugins
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let mapleader = "\<Space>"
source ~/.dotfiles/vim/functions-commands.vim
source ~/.dotfiles/vim/keymappings.conf
source ~/.dotfiles/vim/nerdtree.conf
source ~/.dotfiles/vim/lightline.conf
source ~/.dotfiles/vim/plugins.conf
source ~/.dotfiles/vim/filetypes.vim
source ~/.dotfiles/vim/settings.vim
