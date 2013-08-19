set nocompatible      " Don't force vi compatibility

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

behave xterm          " Alternative is "mswin"
syntax on
set background=dark
let g:solarized_termtrans=1
colorscheme solarized


inoremap jj <ESC>
nnoremap W :w<CR>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


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
set sm                " Show matching brackets/parentheses ...
" set tw=70             " Limit the width of text to 70
set viminfo='20,\"50  " Read/write a .viminfo file, don't store more than 50 lines of registers
set whichwrap=b,s,<,>,[,] " End of line cursor support
set nobackup          " Do not create backup files
set expandtab         " No tabs in the output file!
set hidden
set ruler
set showcmd   " display incomplete commands
set shiftwidth=4      " What you get for ^D
set tabstop=4         " Same as shiftwidth
set foldmethod=indent
set foldlevelstart=99
set vb t_vb=
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for

" searching
set incsearch " BUT do highlight as you type you search phrase
set showmatch
set hlsearch " do not highlight searched for phrases
set ignorecase      " make searching case-insensitive
set smartcase       " make searches with mixed case, case-sensitive
set gdefault        " always substitute globally

" ctags
set tags=./tags,.git/tags,tags;/
map <leader>t <C-]>
map <leader>r <C-t>
map <leader>rc :!run_ctags<Enter>

" Ctrl-P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|target|build)$'

" html5 plugin
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0

" omnicomplete
" only complete the longest common text of all matches (not complete first match) 
set completeopt+=longest

" clear highlighted search results
nnoremap <leader><space> :noh<cr>

set encoding=utf-8


au BufNewFile,BufRead *.tmpl :set ft=html " all my .tmpl files ARE html

filetype on
filetype plugin on
filetype plugin indent on

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


" TRY THESE SOMETIME LATER
"
"Here's a function to overload the <tab> , <c-i> functionality to first go forward in the jump list, and if there is nowhere to go, it will move to the next window:
"
"function! Tab_jump_or_win_move()
"let l = line(".")
"let c = col(".")
"let b = bufnr("%")
"exe "normal! \<esc>\<tab>"
"if l == line(".") && c == col(".") && b == bufnr("%")
"call feedkeys( "\<c-w>\<c-w>", "t" )
"endif
"endfunction
"
"nnoremap <silent> <tab> :call Tab_jump_or_win_move()<CR> 

