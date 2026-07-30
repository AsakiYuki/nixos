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

      show-mode-in-prompt = "on";
      vi-cmd-mode-string = "\\1\\e[1;32m\\2[CMD]\\1\\e[0m\\2 ";
      vi-ins-mode-string = "\\1\\e[1;34m\\2[INS]\\1\\e[0m\\2 ";
      horizontal-scroll-mode = "off";
      enable-bracketed-paste = "on";
      skip-completed-text = "on";
      echo-control-characters = "off";
    };

    bindings = {
      "\\e[A" = "history-search-backward";
      "\\e[B" = "history-search-forward";

      "\\e[1;5C" = "forward-word";
      "\\e[1;5D" = "backward-word";

      "\\e[3;5~" = "kill-word";

      "\\e." = "yank-last-arg";
      "\\eu" = "upcase-word";
      "\\el" = "downcase-word";
      "\\ec" = "capitalize-word";
      "\\et" = "transpose-words";
      "\\es" = "\"\\C-a-sudo \\C-e\"";
      "\\eg" = "\"git status\\C-m\"";
      "jk" = "vi-movement-mode";
    };
  };
}
