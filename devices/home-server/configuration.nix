{
  libs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./network.nix
    (libs.root "/host/server/default.nix")
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Ho_Chi_Minh";
}
