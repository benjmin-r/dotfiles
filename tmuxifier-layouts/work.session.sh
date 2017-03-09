#session_root "~/"

if initialize_session "work"; then
    window_root "~/Downloads"
    new_window "mails"
    run_cmd "m personal"
    split_h
    run_cmd "m work"

    window_root "~/Documents/crispymtn/projects/keyline"
    new_window "keyline"
    split_h

    select_window 1
fi

finalize_and_go_to_session
