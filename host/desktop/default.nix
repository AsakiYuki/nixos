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

    (libs.root "/users/asakiyuki/configuration.nix")

    (libs.root "/modules/services/pipewire.nix")
    (libs.root "/modules/home-manager.nix")

    (libs.root "/overlays/nixpkgs.nix")
    (libs.root "/options/system/default.nix")
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
