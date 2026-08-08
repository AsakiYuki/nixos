_waydroid_completion() {
    local cur prev opts
    COMPREPLY=()
    
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    local main_actions="status log init upgrade session container app prop show-full-ui first-launch shell logcat adb bugreport"
    local global_opts="-h --help -V --version -l --log --details-to-stdout -v --verbose -q --quiet"

    if [[ ${COMP_CWORD} -eq 1 ]] ; then
        if [[ "$cur" == -* ]]; then
            COMPREPLY=( $(compgen -W "${global_opts}" -- "${cur}") )
        else
            COMPREPLY=( $(compgen -W "${main_actions}" -- "${cur}") )
        fi
        return 0
    fi

    case "${prev}" in
        session)
            COMPREPLY=( $(compgen -W "start stop -h --help" -- "${cur}") )
            return 0
            ;;
        container)
            COMPREPLY=( $(compgen -W "start stop restart freeze unfreeze -h --help" -- "${cur}") )
            return 0
            ;;
        app)
            COMPREPLY=( $(compgen -W "install remove launch intent list unfreeze -h --help" -- "${cur}") )
            return 0
            ;;
        prop)
            COMPREPLY=( $(compgen -W "get set -h --help" -- "${cur}") )
            return 0
            ;;
        adb)
            COMPREPLY=( $(compgen -W "connect disconnect -h --help" -- "${cur}") )
            return 0
            ;;
        log)
            COMPREPLY=( $(compgen -W "-h --help -n --lines -c --clear" -- "${cur}") )
            return 0
            ;;
        init)
            COMPREPLY=( $(compgen -W "-h --help -i --images_path -f --force -c --system_channel -v --vendor_channel -r --rom_type -s --system_type --client" -- "${cur}") )
            return 0
            ;;
        upgrade)
            COMPREPLY=( $(compgen -W "-h --help -o --offline" -- "${cur}") )
            return 0
            ;;
        shell)
            COMPREPLY=( $(compgen -W "-h --help -u --uid -g --gid -s --context -L --nolsm -C --allcaps -G --nocgroup" -- "${cur}") )
            return 0
            ;;
        status|show-full-ui|first-launch|bugreport|logcat)
            COMPREPLY=( $(compgen -W "-h --help" -- "${cur}") )
            return 0
            ;;
        -r|--rom_type)
            COMPREPLY=( $(compgen -W "lineage bliss" -- "${cur}") )
            return 0
            ;;
        -s|--system_type)
            COMPREPLY=( $(compgen -W "VANILLA FOSS GAPPS" -- "${cur}") )
            return 0
            ;;
    esac
}

complete -F _waydroid_completion waydroid