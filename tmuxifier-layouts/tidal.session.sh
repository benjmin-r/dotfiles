if initialize_session "tidal"; then
    window_root "~/data/music"
    new_window "[tidal]"
    run_cmd 'vi -c "call OpenTidal()" scratchpad.tidal'
    select_pane 1

    select_window 1
fi

finalize_and_go_to_session
