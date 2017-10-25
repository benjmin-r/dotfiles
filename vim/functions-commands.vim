function! ShowColourSchemeName()
    try
        echo g:colors_name
    catch /^Vim:E121/
        echo "default
    endtry
endfunction

function! SetIndentScala()
    setlocal nopi shiftwidth=2 softtabstop=2 textwidth=120
endfunction

command! SetIndent2Spaces set nopi shiftwidth=2 softtabstop=2
command! SetIndent4Spaces set nopi shiftwidth=4 softtabstop=4
command! SetIndentTabs set noet ci pi sts=0 sw=4 ts=4

command! ShowLineNumbers set relativenumber number
command! DontShowLineNumbers set norelativenumber nonumber

" save a file with sudo, even if vim wasn't called with sudo
cmap w!! w !sudo tee % >/dev/null

" http://vimcasts.org/episodes/soft-wrapping-text/ ... enable soft wrapping
command! -nargs=* Wrap set wrap linebreak nolist
