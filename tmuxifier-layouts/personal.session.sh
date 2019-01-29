if initialize_session "personal"; then
    window_root "~/data/projects/git-projects/squeakyvessel.com"
    new_window "[sq]"
    run_cmd "source .env.fish"
    split_h 70
    run_cmd "source .env.fish"
    select_pane 1


    window_root "~/data/projects/git-projects/cto.coffee"
    new_window "[cto.coffee]"
    run_cmd "source .env.fish"
    split_h 70
    run_cmd "source .env.fish"
    select_pane 1


    select_window 1
fi

finalize_and_go_to_session
