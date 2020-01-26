if initialize_session "sonic-pi"; then
    window_root "~/data/music/music__sonic-pi"
    new_window "[sonic-pi]"
    run_cmd "vi session_`date +%Y-%m-%d`.rb"
fi

finalize_and_go_to_session
