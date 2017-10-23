if initialize_session "work"; then
    window_root "~/Downloads"
    new_window "personal"
    run_cmd "m personal"
    split_h
    run_cmd "cd ~/data/notes"

    window_root "~/Downloads"
    new_window "work"
    run_cmd "m work"
    split_h 70
    run_cmd "work-todos"

    window_root "~/work/crispymtn/projects/keyline"
    new_window "keyline"
    split_h 60

    select_window 1
fi

finalize_and_go_to_session
