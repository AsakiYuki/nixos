{pkgs, ...}: {
  device.pipewire.enable = true;

  imports = [
    ./openssh.nix
    ./fcitx5-lotus.nix
  ];

  services = {
    fail2ban.enable = true;
    flatpak.enable = true;
    displayManager.sddm.enable = true;
    cloudflare-warp.enable = true;
    udisks2.enable = true;
    upower.enable = true;

    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };

  home-manager.users.asakiyuki.services = {
    hyprpolkitagent.enable = true;
  };
}
