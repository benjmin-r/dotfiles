set nocompatible      " Don't force vi compatibility

call plug#begin('~/.neovim/plugged')
    Plug 'frankier/neovim-colors-solarized-truecolor-only'
    Plug 'rakr/vim-one'

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
    Plug 'sunaku/vim-ruby-minitest'
    Plug 'dag/vim-fish'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'  " Tell fzf plugin to use homebrew installed fzf
    Plug 'benjmin-r/vim-i18n'
    Plug 'tpope/vim-commentary'
    Plug 'w0rp/ale'
    Plug 'jlanzarotta/bufexplorer', { 'on': ['BufExplorer'] }

    Plug 'junegunn/goyo.vim', { 'on': ['Goyo'] }
    Plug 'dracula/vim'

    Plug 'dermusikman/sonicpi.vim'
    Plug 'tpope/vim-unimpaired'
call plug#end()


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" color scheme
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
behave xterm

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
set colorcolumn=120


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Keymappings and complex plugins
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let mapleader = "\<Space>"

source ~/.dotfiles/vim/lightline.conf
source ~/.dotfiles/vim/functions-commands.vim
source ~/.dotfiles/vim/keymappings.conf
source ~/.dotfiles/vim/nerdtree.conf
source ~/.dotfiles/vim/plugins.conf
source ~/.dotfiles/vim/filetypes.vim
source ~/.dotfiles/vim/settings.vim


function! Solar_light()
    set background=light
    colorscheme solarized
    " tell iterm to switch to light color profile
    silent !osascript -e 'tell app "System Events" to keystroke "l" using {shift down, option down, control down}'
    execute "silent !tmux source-file " . shellescape(expand('~/.dotfiles/tmux/solarized/tmuxcolors-light.conf'))
endfunction

function! Solar_dark()
    set background=dark
    colorscheme solarized
    " tell iterm to switch to dark color profile
    silent !osascript -e 'tell app "System Events" to keystroke "d" using {shift down, option down, control down}'
    execute "silent !tmux source-file " . shellescape(expand('~/.dotfiles/tmux/solarized/tmuxcolors-dark.conf'))
endfunction

function! Solar_swap()
    if &background ==? 'dark'
        call Solar_light()
    else
        call Solar_dark()
    endif
endfunction

command! SolarDark  call Solar_dark()
command! SolarLight call Solar_light()
command! SolarSwap  call Solar_swap()

nnoremap <leader>sd :SolarDark<CR>
nnoremap <leader>sl :SolarLight<CR>
