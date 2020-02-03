syntax on
set timeout              " the following three lines make for a snappy space key
set timeoutlen=500      " reaction even though it's configured as leader key
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
set wildmenu             " Enhance command-line completion
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
set tags=./tags,.git/tags,tags;/
set encoding=utf-8

set textwidth=120
set colorcolumn=120

set nojoinspaces      " Insert only one space when joining lines that contain sentence-terminating
set ai                " Turn on autoindenting
set expandtab         " No tabs in the output file!
set shiftwidth=4      " What you get for ^D
set softtabstop=4     " indent without tabs, default 4 spaces
set copyindent        " mimic indent behaviour of current file
set hlsearch        " do not highlight searched for phrases
set incsearch       " BUT do highlight as you type you search phrase
set ignorecase      " make searching case-insensitive
set smartcase       " make searches with mixed case, case-sensitive
set gdefault        " always substitute globally

" enable soft line linewrapping per buffer by issuing :Wrap
command! -nargs=* Wrap set wrap linebreak nolist textwidth=500

