_brightnessctl_completion() {
    local cur prev opts operations classes
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    opts="-l --list -q --quiet -p --pretend -m --machine-readable -n --min-value -e --exponent -s --save -r --restore -h --help -d --device -c --class -V --version"
    
    operations="i info g get m max s set"
    
    classes="backlight leds"

    case "${prev}" in
        -c|--class)
            COMPREPLY=( $(compgen -W "${classes}" -- "${cur}") )
            return 0
            ;;
        -d|--device)
            local devices=""
            if [ -d /sys/class/backlight ]; then
                devices=$(ls /sys/class/backlight)
            fi
            if [ -d /sys/class/leds ]; then
                devices="${devices} $(ls /sys/class/leds)"
            fi
            COMPREPLY=( $(compgen -W "${devices}" -- "${cur}") )
            return 0
            ;;
        s|set)
            COMPREPLY=( $(compgen -W "10% 20% 50% 80% 100% +10% -10%" -- "${cur}") )
            return 0
            ;;
        -h|--help|-V|--version|-l|--list|-g|get|-m|max|-i|info)
            return 0
            ;;
    esac

    if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
        return 0
    else
        COMPREPLY=( $(compgen -W "${operations}" -- "${cur}") )
        return 0
    fi
}

complete -F _brightnessctl_completion brightnessctl