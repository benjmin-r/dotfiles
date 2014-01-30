set nocompatible      " Don't force vi compatibility

call pathogen#infect()
filetype off
syntax on
filetype plugin on
filetype plugin indent on

behave xterm          " Alternative is "mswin"
syntax on
set background=dark
let g:solarized_termtrans=1
colorscheme solarized


" enable arrow keys for easier pairing
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
inoremap jk <ESC>
nnoremap W :w<CR>
nnoremap j gj
nnoremap k gk

" move between splits easily 
"  .... commented out because of vim-tmux-navigator plugin
" map <C-J> <C-W>j<C-W>_
" map <C-K> <C-W>k<C-W>_
" map <C-L> <C-W>l<C-W>_
" map <C-H> <C-W>h<C-W>_
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr><C-W>_
nnoremap <silent> <C-K> :TmuxNavigateUp<cr><C-W>_
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Execute the tests
map <silent>tf <Esc>:Pytest file<CR>
map <silent>tc <Esc>:Pytest class<CR>
map <silent>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent>tn <Esc>:Pytest next<CR>
nmap <silent>tp <Esc>:Pytest previous<CR>
nmap <silent>te <Esc>:Pytest error<CR>
nmap <silent>tee <Esc>:Pytest end<CR>

" With the following mapping you can press Q every time you alter something in 
" a paragraph, and the line-breaks get sorted out. The default meaning of 
" Q is not useful, and anyway gQ makes a better job of it.
vnoremap Q gq
nnoremap Q gqap

map <F12> :set number!<CR>
map <C-i> :set encoding=utf8<Enter>

let mapleader = ","

" open current line on github ... based on
" http://felixge.de/2013/08/08/vim-trick-open-current-line-on-github.html
nnoremap <leader>g :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" show invisible characters
set list
set listchars=tab:▸\ ,eol:¬

" get rid of F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" save file when losing focus
au FocusLost * :wa

" strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>da :Dash
nnoremap <leader>a :Ack 

" save a file with sudo, even if vim wasn't called with sudo
cmap w!! w !sudo tee % >/dev/null

set relativenumber
set scrolloff=999       " keeps current line centered on screen
set confirm
set mouse=a           " Enable mouse support
set number            " always show line numbers
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set nowrap
set selectmode=key    " to enter visual mode when selecting with mouse
set ai                " Turn on autoindenting
set aw                " Save file when compiling, etc.
set bs=2              " Allow backspacing over everything in insert mode
set viminfo='20,\"50  " Read/write a .viminfo file, don't store more than 50 lines of registers
set whichwrap=b,s,<,>,[,] " End of line cursor support
set nobackup          " Do not create backup files
set hidden
set ruler
set showcmd           " display incomplete commands
set foldmethod=indent
set foldlevelstart=99
set vb t_vb=
set showmatch         " show matching brackets
set mat=5             " how many tenths of a second to blink matching brackets for
set pastetoggle=<leader>pp

" indent without tabs, default 4 spaces
set expandtab         " No tabs in the output file!
set shiftwidth=4      " What you get for ^D
set softtabstop=4
map <leader>i2 :set shiftwidth=2 softtabstop=2<CR>
map <leader>i4 :set shiftwidth=4 softtabstop=4<CR>

" searching
set hlsearch        " do not highlight searched for phrases
set incsearch       " BUT do highlight as you type you search phrase
set showmatch
set ignorecase      " make searching case-insensitive
set smartcase       " make searches with mixed case, case-sensitive
set gdefault        " always substitute globally

" ctags
set tags=./tags,.git/tags,tags;/
map <leader>t g<C-]>        " jump to tag under cursor, showing match-list if more than one match
map <leader>wt <C-W>g<C-]>  " open matching tag in new buffer
map <leader>m g]            " show list of matching tags
map <leader>wm <C-W>g]      " show list of matching tags in a new buffer
map <leader>r <C-t>         " jump back to previous tag on stack
map <leader>rc :!run_ctags<Enter>

" Ctrl-P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.?(git|hg|svn|target|build|node_modules)$'

" html5 plugin
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0

" omnicomplete
" only complete the longest common text of all matches (not complete first match) 
set completeopt+=longest

" indent guide plugin
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup=1

" clear highlighted search results
nnoremap <leader><space> :noh<cr>

set encoding=utf-8


au BufNewFile,BufRead *.tmpl :set ft=html " all my .tmpl files ARE html

" enable omnicomplete
set omnifunc=syntaxcomplete#Complete

" Add the virtualenv's site-packages to vim path
if has("python")
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif


" http://vimcasts.org/episodes/soft-wrapping-text/
" enable soft wrapping"
command! -nargs=* Wrap set wrap linebreak nolist

" use j, k, $, 0 and ^ on display lines by holding down the command key.
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^"
