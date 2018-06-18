if initialize_session "work"; then
    window_root "~/Downloads"
    new_window "work"
    run_cmd "m work"
    split_h 60

    window_root "~/work/crispymtn/projects/keyline"
    new_window "keyline-workers"
    run_cmd "source .env.fish;"
    split_h 70
    run_cmd "source .env.fish"
    select_pane 1
    split_v
    run_cmd "source .env.fish;"

    window_root "~/work/crispymtn/projects/keyline"
    new_window "keyline"
    run_cmd "source .env.fish"
    split_h 60
    run_cmd "source .env.fish"

    select_window 1
    select_pane 1
fi

finalize_and_go_to_session
