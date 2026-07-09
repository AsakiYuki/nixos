_agenix_completion() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    opts="-h --help -e --edit -r --rekey -d --decrypt -i --identity -v --verbose"

    case "${prev}" in
        -e|--edit|-d|--decrypt)
            COMPREPLY=( $(compgen -f -- "${cur}") )
            return 0
            ;;
        -i|--identity)
            COMPREPLY=( $(compgen -f -- "${cur}") )
            return 0
            ;;
        *)
            ;;
    esac

    if [[ ${cur} == -* ]] || [[ ${COMP_CWORD} -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
        return 0
    fi

    COMPREPLY=( $(compgen -f -- "${cur}") )
}

complete -F _agenix_completion agenix