{
  libs,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./mount.nix
    
    (libs.root "/host/desktop/default.nix")
    (libs.root "/home/asakiyuki/configuration.nix")
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Ho_Chi_Minh";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  device = {
    flake-name = "ideapad-slim-5";
    cursors = "aemeath";

    dm.sddm.enable = true;
    dm.gdm.enable = false;

    de.kdePlasma.enable = false;
    de.gnome.enable = false;

    wm.niri.enable = false;
    wm.hyprland.enable = true;

    bluetooth.enable = true;
    flatpak.enable = true;

    programs = {
      terminal = "ghostty";
      obs-studio.enable = true;
      nixcord.enable = true;
      tmux.enable = true;
      starship.enable = true;
      fastfetch.enable = true;
      cider-2.enable = true;
      steam.enable = true;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = [ pkgs.linuxPackages_latest.zenpower ];
  system.stateVersion = "25.11";
}
