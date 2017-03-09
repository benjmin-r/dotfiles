set nocompatible      " Don't force vi compatibility

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Pathogen loads plugins
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

call pathogen#infect()
filetype off
filetype plugin on
filetype plugin indent on


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" color scheme
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

behave xterm
set term=xterm-256color
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Keymappings and complex plugins
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let mapleader = "\<Space>"
source ~/.vim/keymappings.conf
source ~/.vim/nerdtree.conf
source ~/.vim/lightline.conf
source ~/.vim/plugins.conf


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Commands
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" save a file with sudo, even if vim wasn't called with sudo
cmap w!! w !sudo tee % >/dev/null

" http://vimcasts.org/episodes/soft-wrapping-text/ ... enable soft wrapping
command! -nargs=* Wrap set wrap linebreak nolist


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

syntax on
set timeout              " the following three lines make for a snappy space key
set timeoutlen=3000      " reaction even though it's configured as leader key
set ttimeoutlen=200

set laststatus=2         " show lightline/airline right after startup
set list                 " show invisible characters
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:.,trail:·
set relativenumber
set scrolloff=7          " keeps current line from reaching top or bottom
set cursorline           " highlight current line
set confirm
set mouse=a              " Enable mouse support
set number               " always show line numbers
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class
set noesckeys
set wildmenu             " Enhance command-line completion
"set clipboard=unnamed    " use system clipboard
set autoread             " reload file w/o asking if it changed outside of vim
set undoreload=15000     " increase memory for undo after file reload
set title                " change the terminal's title
set nowrap
set selectmode=key    " to enter visual mode when selecting with mouse
set bs=2              " Allow backspacing over everything in insert mode
set viminfo='20,\"50  " Read/write a .viminfo file, don't store more than 50 lines of registers
set whichwrap=b,s,<,>,[,] " End of line cursor support
set nobackup          " Do not create backup files
set hidden
set ruler
set showcmd           " display incomplete commands
set foldmethod=indent
set foldlevelstart=999
set vb t_vb=
set showmatch         " show matching brackets
set mat=5             " how many tenths of a second to blink matching brackets for
set pastetoggle=<leader>pp
set modeline          " enable applying of modelines (such as for setting ft in file itself)
set modelines=1
set tw=80
set colorcolumn=+1
set tags=./tags,.git/tags,tags;/
set encoding=utf-8
" Insert only one space when joining lines that contain sentence-terminating
" " punctuation like `.`.
set nojoinspaces"

" indent without tabs, default 4 spaces
set ai                " Turn on autoindenting
set expandtab         " No tabs in the output file!
set shiftwidth=4      " What you get for ^D
set softtabstop=4
set copyindent        " mimic indent behaviour of current file

" searching
set hlsearch        " do not highlight searched for phrases
set incsearch       " BUT do highlight as you type you search phrase
set showmatch
set ignorecase      " make searching case-insensitive
set smartcase       " make searches with mixed case, case-sensitive
set gdefault        " always substitute globally

function SetIndentScala()
    setlocal nopi shiftwidth=2 softtabstop=2 textwidth=120
endfunction
command SetIndent2Spaces set nopi shiftwidth=2 softtabstop=2
command SetIndent4Spaces set nopi shiftwidth=4 softtabstop=4
command SetIndentTabs set noet ci pi sts=0 sw=4 ts=4

command ShowLineNumbers set relativenumber number
command DontShowLineNumbers set norelativenumber nonumber

if has("autocmd")
  " Enable file type detection
  filetype on
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead,BufEnter *.css SetIndent2Spaces
  autocmd BufNewFile,BufRead,BufEnter *.js SetIndent2Spaces
  autocmd BufNewFile,BufRead,BufEnter *.html SetIndent2Spaces
  autocmd BufNewFile,BufRead,BufEnter *.yml SetIndent2Spaces
  autocmd BufNewFile,BufRead,BufEnter *.rb SetIndent2Spaces
  autocmd BufNewFile,BufRead,BufEnter *.scala call SetIndentScala()
  au BufNewFile,BufRead *.prawn set filetype=ruby

  autocmd FileType mail setlocal spell spelllang=de_de
  autocmd FileType markdown setlocal spell spelllang=en_gb

endif

" Rename current file, thanks to Gary Bernhardt
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

highlight GitGutterAdd ctermfg=darkgreen
highlight GitGutterChange ctermfg=darkyellow
highlight GitGutterDelete ctermfg=darkred
highlight GitGutterChangeDelete ctermfg=darkyellow
highlight SignColumn ctermbg=black
