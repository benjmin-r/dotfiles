#session_root "~/"

if initialize_session "work"; then
    window_root "~/Downloads"
    new_window "m personal"
    run_cmd "m personal"
    split_h
    run_cmd "m personal -f ~/.mail/personal/lists/"

    window_root "~/Downloads"
    new_window "m work"
    run_cmd "m work"


    window_root "~/Documents/Vaamo/projects/vaamo-backend"
    new_window "vaamo-backend"
    split_h

    select_window 1
fi

finalize_and_go_to_session
