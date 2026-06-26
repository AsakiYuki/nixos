{lib, ...}: {
  imports = [
    ./programs.nix
    ./environment.nix
    ./programs.nix
    ./hardware.nix
  ];

  options.device = {
    flatpak.enable = lib.mkEnableOption "flatpak";
  };
}
