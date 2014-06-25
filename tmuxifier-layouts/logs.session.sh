session_root "~/Documents/Vaamo/logstreaming"

if initialize_session "logs"; then
    new_window "app-prod1"
    new_window "ffb-gateway"
    new_window "mail"
    new_window "db1"
    new_window "app-prod2"

    select_window 1
fi

finalize_and_go_to_session
