_trousseau() {
    local cur prev

    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case ${COMP_CWORD} in
        1)
            COMPREPLY=($(compgen -W "get set del keys show meta help create \
                                     push pull export import \
                                     add-recipient remove-recipient" ${cur}))
            ;;
        2)
            case ${prev} in
                get|set|del)
                    local keys=$(trousseau keys)
                    COMPREPLY=($(compgen -W "${keys[*]}" ${cur}))
                    ;;
            esac
            ;;
        *)
            COMPREPLY=()
            ;;
    esac
}

# also map alias 't' to be completed
complete -F _trousseau trousseau t
