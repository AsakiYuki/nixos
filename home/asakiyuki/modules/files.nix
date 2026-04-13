{
  pkgs,
  lib,
  osconfig,
  config,
  ...
}:
{
  home.file = lib.mkMerge [
    (builtins.mapAttrs (_: path: {
      source = path;
    }) osconfig.device.files.source)

    (builtins.mapAttrs (_: path: {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/${path}";
    }) osconfig.device.files.symlink)

    (lib.mkMerge (
      builtins.map (name: lib.setAttrByPath [ name "force" ] true) (
        builtins.attrNames osconfig.device.files.force
      )
    ))

    (lib.mkMerge (
      builtins.map (name: lib.setAttrByPath [ name "force" ] (lib.mkForce true)) (
        builtins.attrNames osconfig.device.files.mkForce
      )
    ))
  ];

  xdg.configFile.kdeglobals.text =
    if (osconfig.device.wm.hyprland.enable || osconfig.device.wm.niri.enable) then
      builtins.readFile (
        (pkgs.catppuccin-kde.override {
          flavour = [ "mocha" ];
          accents = [ "sapphire" ];
        })
        + "/share/color-schemes/CatppuccinMochaSapphire.colors"
      )
      + ''

        [UiSettings]
        ColorScheme=qt6ct

        [General]
        TerminalApplication=${osconfig.device.programs.terminal}

        [Icons]
        Theme=Papirus
      ''
    else
      "";
}
