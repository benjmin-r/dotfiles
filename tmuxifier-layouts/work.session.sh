if initialize_session "work"; then
    window_root "~/Downloads"
    new_window "work"
    run_cmd "m work"
    split_h 60
    run_cmd "work-todos"

    window_root "~/work/crispymtn/projects/keyline"
    new_window "keyline"
    run_cmd "source .env.fish"
    split_h 60
    run_cmd "source .env.fish"

    select_window 1
    select_pane 1
fi

finalize_and_go_to_session
