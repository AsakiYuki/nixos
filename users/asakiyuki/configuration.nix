{
  inputs,
  libs,
  config,
  custom,
  unstable,
  ...
}: let
  osconfig = config;
in {
  users.users.asakiyuki = {
    isNormalUser = true;
    extraGroups = ["wheel"];
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
      ./programs.nix

      ../../modules/features/home/theme.nix
      ../../options/home/default.nix

      inputs.nixvim.homeModules.nixvim
      inputs.nixcord.homeModules.nixcord
      inputs.niri.homeModules.niri
      inputs.millennium-config.homeManager.default
    ];

    home = {
      username = "asakiyuki";
      stateVersion = "25.11";
    };
  };
}
