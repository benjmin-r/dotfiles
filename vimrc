scriptencoding utf-8
set encoding=utf-8
set nocompatible      " Don't force vi compatibility

filetype off
filetype plugin on
filetype plugin indent on

call plug#begin('~/.vim/plugged')
    Plug 'lifepillar/vim-solarized8'

    Plug 'christoomey/vim-tmux-navigator'
    Plug 'benmills/vimux'
    Plug 'itchyny/lightline.vim'
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}
    Plug 'mileszs/ack.vim', { 'on': ['Ack', 'Ack!'] }
    Plug 'jlanzarotta/bufexplorer', { 'on': ['BufExplorer'] }
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'  " Tell fzf plugin to use homebrew installed fzf
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-rhubarb'
    Plug 'ervandew/supertab'
    Plug 'airblade/vim-gitgutter'
    Plug 'qpkorr/vim-bufkill'
    Plug 'w0rp/ale'
    Plug 'sheerun/vim-polyglot'
    Plug 'Alok/notational-fzf-vim'
    Plug 'trevordmiller/nova-vim'

    Plug 'dermusikman/sonicpi.vim'

    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'

    Plug 'dracula/vim'

    " Intellisense-style autocomplete
    "Plug 'Shougo/deoplete.nvim'
    "Plug 'roxma/nvim-yarp'
    "Plug 'roxma/vim-hug-neovim-rpc'
    "Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

    "Plug 'garbas/vim-snipmate'
    "Plug 'kchmck/vim-coffee-script'
    "Plug 'jiangmiao/auto-pairs'
    "Plug 'tpope/vim-endwise'
    "Plug 'sunaku/vim-ruby-minitest'
    "Plug 'benjmin-r/vim-i18n'
call plug#end()

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" color scheme
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
behave xterm

set term=screen-256color
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
"colorscheme solarized8
colorscheme dracula


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

"function! Solar_light()
"    set background=light
"    colorscheme solarized8
"    " tell iterm to switch to light color profile
"    "silent !osascript -e 'tell app "System Events" to keystroke "l" using {shift down, option down, control down}'
"endfunction
"
"function! Solar_dark()
"    set background=dark
"    colorscheme solarized8
"    " tell iterm to switch to dark color profile
"    "silent !osascript -e 'tell app "System Events" to keystroke "d" using {shift down, option down, control down}'
"endfunction
"
"function! Solar_swap()
"    if &background ==? 'dark'
"        call Solar_light()
"    else
"        call Solar_dark()
"    endif
"endfunction
"
"command! SolarDark  call Solar_dark()
"command! SolarLight call Solar_light()
"command! SolarSwap  call Solar_swap()
"
"nnoremap <leader>sd :SolarDark<CR>
"nnoremap <leader>sl :SolarLight<CR>
