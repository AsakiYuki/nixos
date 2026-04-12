{
  inputs,
  libs,
  config,
  pkgs,
  custom,
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
    _module.args = { inherit inputs osconfig custom libs; };
    imports = [
      ./modules/programs.nix
      ./modules/files.nix
      ./modules/env.nix
      
      ../../modules/features/home/theme.nix

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
  };
}

