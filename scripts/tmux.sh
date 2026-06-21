allowed_terms=("xterm-kitty" "xterm-ghostty")

should_run_tmux=false
for term in "${allowed_terms[@]}"; do
    if [[ "$TERM" == "$term" ]]; then
        should_run_tmux=true
        break
    fi
done

if [ -z "$TMUX" ] && [ "$should_run_tmux" = true ]; then
    exec tmux
fi