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
