#session_root "~/"

if initialize_session "work"; then
    window_root "~/Downloads"
    new_window "m personal"
    run_cmd "m personal"
    split_h
    #run_cmd "m personal -f ~/.mail/personal/lists/"
    run_cmd "m personal"

    window_root "~/Downloads"
    new_window "m work"
    run_cmd "m work"
    split_h
    run_cmd "m work"


    window_root "~/Documents/Vaamo/projects/vaamo-backend"
    new_window "vaamo-backend"
    split_h

    window_root "~/data/blog-drafts"
    new_window "blog-drafts"
    split_h

    select_window 1
fi

finalize_and_go_to_session
