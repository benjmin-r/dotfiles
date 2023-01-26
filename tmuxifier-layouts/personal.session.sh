if initialize_session "personal"; then
    new_window "[mail & notes]"
    split_h
    run_cmd "cd ~/data/notes"

    window_root "~/data/work/code/cto.coffee"
    new_window "[cto.coffee]"
    run_cmd "source .env.fish"
    split_h 70
    run_cmd "source .env.fish; and vim"
    select_pane 1
    split_v 20
    run_cmd "source .env.fish"

    #window_root "~/data/work/code/humansconf.org"
    #new_window "[#humansconf]"
    #run_cmd "source .env.fish"
    #split_h 70
    #run_cmd "and source .env.fish; and vim"
    #select_pane 1
    #split_v 20
    #run_cmd "and source .env.fish"

    select_window 1
fi

finalize_and_go_to_session
