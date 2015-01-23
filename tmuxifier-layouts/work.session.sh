session_root "~/"

if initialize_session "work"; then
    window_root "~/Downloads"
    new_window "m uberspace"
    run_cmd "m uberspace"
    split_h
    #run_cmd "mutt-personal -f ~/.mail/ambestengestern.de/lists/"

    window_root "~/Downloads"
    new_window "m work"
    run_cmd "m work"


    window_root "~/Documents/Vaamo/projects/vaamo-backend"
    new_window "vaamo-backend"
    split_h

    window_root "~/Documents/Vaamo/projects/vaamo-web-frontend"
    new_window "vaamo-frontend"
    split_h

    select_window 1
fi

finalize_and_go_to_session
