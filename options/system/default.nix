{lib, ...}: {
  imports = [
    ./programs.nix
    ./environment.nix
    ./programs.nix
  ];

  options.device = {
    flatpak.enable = lib.mkEnableOption "flatpak";
    pipewire.enable = lib.mkEnableOption "pipewire";
  };
}
