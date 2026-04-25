{
  pkgs,
  lib,
  osconfig,
  config,
  ...
}: {
  home.file = lib.mkMerge [
    (builtins.mapAttrs (_: path: {
        source = path;
      })
      config.files.source)

    (builtins.mapAttrs (_: path: {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/${path}";
      })
      config.files.symlink)

    (lib.mkMerge (
      builtins.map (name: lib.setAttrByPath [name "force"] true) (
        builtins.attrNames config.files.force
      )
    ))

    (lib.mkMerge (
      builtins.map (name: lib.setAttrByPath [name "force"] (lib.mkForce true)) (
        builtins.attrNames config.files.mkForce
      )
    ))
  ];

  xdg.configFile.kdeglobals =
    lib.mkIf (osconfig.device.wm.hyprland.enable || osconfig.device.wm.niri.enable)
    {
      text = (
        builtins.readFile (
          (pkgs.catppuccin-kde.override {
            flavour = ["mocha"];
            accents = ["sapphire"];
          })
          + "/share/color-schemes/CatppuccinMochaSapphire.colors"
        )
        + ''

          [UiSettings]
          ColorScheme=qt6ct

          [General]
          TerminalApplication=${osconfig.device.programs.terminal.name}

          [Icons]
          Theme=Papirus
        ''
      );
    };
}
