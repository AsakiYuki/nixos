{...}: {
  programs = {
    bash.shellAliases = {
      togglehdr = ''hyprctl eval "toggleHDR()"'';
    };
  };
}
