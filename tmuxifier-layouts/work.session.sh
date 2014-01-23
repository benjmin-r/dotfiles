session_root "~/"

if initialize_session "work"; then
    window_root "~/Downloads"
    new_window "mutt-personal"
    run_cmd "mutt-personal"

    window_root "~/Downloads"
    new_window "mutt-work"
    run_cmd "mutt-work"

    window_root "~/Documents/Vaamo/projects/vaamo-backend"
    new_window "dev-backend"
    split_h

    window_root "~/Documents/Vaamo/projects/vaamo-infrastructure"
    new_window "dev-infrastructure"
    run_cmd "workon vaamo-infrastructure && clear"
    split_h
    run_cmd "workon vaamo-infrastructure && clear"

    select_window 4
fi

finalize_and_go_to_session
