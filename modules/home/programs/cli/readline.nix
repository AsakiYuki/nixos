{...}: {
  programs.readline = {
    enable = true;

    variables = {
      completion-ignore-case = "on";
      show-all-if-ambiguous = "on";
      completion-map-case = "on";
      colored-stats = "on";
      visible-stats = "on";
      mark-symlinked-directories = "on";

      expand-tilde = "on";
      history-preserve-point = "on";
      bell-style = "none";

      editing-mode = "vi";
    };

    bindings = {
      "\\e[A" = "history-search-backward";
      "\\e[B" = "history-search-forward";

      "\\e[1;5C" = "forward-word";
      "\\e[1;5D" = "backward-word";

      # --- Xóa từ ---
      "\\e[3;5~" = "kill-word";
    };
  };
}
