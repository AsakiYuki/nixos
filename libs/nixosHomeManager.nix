{
  inputs,
  custom,
  config,
  unstable,
  libs,
  ...
}: let
  osconfig = config;
in {
  config.home-manager.users =
    builtins.mapAttrs (name: value: {
      _module.args = {inherit inputs unstable osconfig custom libs;};
      imports = [
        (libs.root "/options/home/default.nix")
        inputs.nixvim.homeModules.nixvim
        inputs.nixcord.homeModules.nixcord
        inputs.niri.homeModules.niri
      ];

      home = {
        username = name;
        stateVersion = config.system.stateVersion;
      };
    })
    config.home-manager.users;
}
