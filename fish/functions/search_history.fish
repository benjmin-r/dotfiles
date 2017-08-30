function search_history
  set cmd (commandline)

  history | fzf | read from_fzf

  if [ $from_fzf ]
    commandline $from_fzf
  else
    commandline $cmd
  end
end
