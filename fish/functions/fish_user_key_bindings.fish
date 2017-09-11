function fish_user_key_bindings
  bind --mode insert --sets-mode default jk backward-char force-repaint

  bind -M visual -m insert c kill-selection end-selection force-repaint

  bind \cl 'clear; commandline -f repaint'
  bind -M insert \cl 'clear; commandline -f repaint'

  bind -M insert \cf forward-word

  bind \cu backward-kill-line

  bind -M default V edit_command
  bind -M default K commandline_man

  #bind \cr search_history
  #bind -M insert \cr search_history

  set -q FZF_LEGACY_KEYBINDINGS
    or set -l FZF_LEGACY_KEYBINDINGS 1
  if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
    bind \ce 'nvim (fzf)'
    bind \ct '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \cx '__fzf_find_and_execute'
    bind \ec '__fzf_cd'
    bind \eC '__fzf_cd_with_hidden'
    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \ce 'nvim (fzf)'
        bind -M insert \ct '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \cx '__fzf_find_and_execute'
        bind -M insert \ec '__fzf_cd'
        bind -M insert \eC '__fzf_cd_with_hidden'
    end
  else
    bind \cf '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \ex '__fzf_find_and_execute'
    bind \eo '__fzf_cd'
    bind \eO '__fzf_cd_with_hidden'
    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \cf '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \ex '__fzf_find_and_execute'
        bind -M insert \eo '__fzf_cd'
        bind -M insert \eO '__fzf_cd_with_hidden'
    end
  end
  ### fzf ###
end
