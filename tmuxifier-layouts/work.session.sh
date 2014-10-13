session_root "~/"

if initialize_session "work"; then
    window_root "~/Downloads"
    new_window "mutt-personal"
    run_cmd "mutt-personal"
    split_h
    run_cmd "mutt-personal -f ~/.mail/ambestengestern.de/lists/"

    window_root "~/Downloads"
    new_window "mutt-work"
    run_cmd "mutt-work"


    window_root "~/Documents/Vaamo/projects/vaamo-backend"
    new_window "vaamo-backend"
    split_h

    window_root "~/Documents/Vaamo/projects"
    new_window "vaamo-projects"
    split_h

    select_window 1
fi

finalize_and_go_to_session
