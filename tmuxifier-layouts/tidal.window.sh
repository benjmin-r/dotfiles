if initialize_session "work"; then
    window_root "~/data/music/music__sonic-pi"
    new_window "[sonic-pi]"
    run_cmd "vi session.rb"
    split_v 95
    select_pane 1
fi

finalize_and_go_to_session
