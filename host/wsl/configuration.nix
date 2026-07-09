{pkgs, libs, lib, ...}: {
  imports = [
    (libs.root "/users/asakiyuki/configuration.nix")
  ];

  wsl.enable = true;
  wsl.defaultUser = "asakiyuki";

  security.sudo.wheelNeedsPassword = lib.mkForce false;
  services.tailscale.enable = true;

  home-manager.users.asakiyuki.programs = {
    bash.enable = true;
    fastfetch.enable = true;
    starship.enable = true;
  };
}