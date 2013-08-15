
set lines=65 columns=160
set background=light
colorscheme solarized
"set guifont=Monaco:h10

set colorcolumn=85

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
end

"NERDTree
set relativenumber
