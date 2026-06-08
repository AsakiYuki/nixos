{pkgs, ...}: {
  services = {
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  home-manager.users.asakiyuki.services = {
    hyprpolkitagent.enable = true;
  };
}
