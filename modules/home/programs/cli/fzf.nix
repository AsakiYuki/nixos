{
  config,
  lib,
  ...
}: {
  programs.fzf = {
    enable = true;
    defaultCommand = null;
    enableBashIntegration = true;

    fileWidgetOptions = [
      "--preview 'head {}'"
    ];

    historyWidgetOptions = [
      "--sort"
      "--exact"
    ];

    defaultOptions = [
      "--height 40%"
      "--border"
    ];

    # fileWidgetCommand = "fd --type f";
    # changeDirWidgetCommand = "fd --type d";

    colors = {};

    tmux = lib.mkIf config.programs.tmux.enable {
      enableShellIntegration = true;
      shellIntegrationOptions = [
        "-d 40%"
      ];
    };
  };
}
