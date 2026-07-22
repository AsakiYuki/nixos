{
  lib,
  config,
  ...
}: {
  imports = [
    ./services-menu.nix
    ./settings.nix
  ];

  programs.kde.kdeglobals = {
    enable = true;
    config.PreviewSettings = lib.optionalAttrs config.programs.dolphin.enable {
      EnableRemoteFolderThumbnail = true;
      MaximumRemoteSize = 1024 * 1024 * 1024 * 5;
      MaximumSize = 1024 * 1024 * 1024 * 5;
    };
  };
}
