{
  inputs,
  libs,
  config,
  pkgs,
  custom,
  unstable,
  ...
}:
let
  osconfig = config;
in
{
  users.users.asakiyuki = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.asakiyuki = {
    _module.args = {
      inherit
        inputs
        unstable
        osconfig
        custom
        libs
        ;
    };
    imports = [
      ./modules/programs.nix
      ./modules/files.nix
      ./modules/env.nix

      ../../modules/features/home/theme.nix
      ../../options/home/default.nix

      inputs.nixvim.homeModules.nixvim
      inputs.nixcord.homeModules.nixcord
      inputs.niri.homeModules.niri
    ];

    home = {
      username = "asakiyuki";
      stateVersion = "25.11";
      pointerCursor =
        (custom.cursors {
          name = osconfig.device.cursors;
          size = 48;
        })
          { pkgs = pkgs; };
    };

    programs = {
      catppuccin.enable = true;
      antigravity.enable = true;
      hyprshot.enable = true;
      prismlauncher.enable = true;
      proton-ge.enable = true;
      vlc.enable = true;
      gimp.enable = true;
      libreoffice.enable = true;
      lutris.enable = true;
      osu.enable = true;
      lmstudio.enable = true;
      blender.enable = true;
      xprop.enable = true;
      bluetuith.enable = true;
      pavucontrol.enable = true;
      nwg-look.enable = true;
      proton-apps.enable = true;
      hytale.enable = true;
      cider.enable = true;
    };
  };
}
