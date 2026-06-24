{
  libs,
  custom,
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./programs.nix
    ./device.nix
    ./users.nix
    ./services.nix
    ./ssh.nix

    (libs.root "/modules/hardware/default.nix")

    (libs.root "/modules/fonts.nix")

    (libs.root "/modules/features/system/packages.nix")
    (libs.root "/modules/features/system/waydroid.nix")
    (libs.root "/modules/features/system/boot.nix")
    (libs.root "/modules/features/system/sddm.nix")
    (libs.root "/modules/features/system/gdm.nix")
    (libs.root "/modules/features/system/kde-plasma.nix")
    (libs.root "/modules/features/system/gnome.nix")
    (libs.root "/modules/features/system/niri.nix")
    (libs.root "/modules/features/system/hyprland.nix")
    (libs.root "/modules/features/system/input-method.nix")
    (libs.root "/modules/features/system/steam.nix")
    (libs.root "/modules/features/system/nix-dl.nix")
    (libs.root "/modules/features/system/flatpak.nix")
    (libs.root "/modules/features/system/udisks2.nix")
    (libs.root "/modules/features/system/dconf.nix")
    (libs.root "/modules/features/system/cloudflare.nix")
    (libs.root "/modules/features/system/docker.nix")
    (libs.root "/modules/features/system/upower.nix")
    (libs.root "/modules/features/system/direnv.nix")

    (libs.root "/users/asakiyuki/configuration.nix")

    (libs.root "/overlays/nixpkgs.nix")
  ];

  networking.firewall.allowedTCPPorts = [
    27036
    27037
  ];

  networking.firewall.allowedUDPPorts = [
    27031
    27032
    27033
    27034
    27035
    27036
    4380
    3478
    4379
  ];

  home-manager.users.asakiyuki = {
    home.pointerCursor =
      (custom.cursors {
        name = config.device.cursors;
        size = 48;
      })
      {pkgs = pkgs;};
  };

  boot.kernelParams = [
    "usbcore.autosuspend=-1"
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  xdg.menus.enable = true;
  services.dbus.enable = true;
}
