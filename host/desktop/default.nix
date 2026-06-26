{
  libs,
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
    (libs.root "/users/asakiyuki/configuration.nix")
  ];

  networking.firewall.allowedTCPPorts = [27036 27037];
  networking.firewall.allowedUDPPorts = [27031 27032 27033 27034 27035 27036 4380 3478 4379];

  boot.kernelParams = ["usbcore.autosuspend=-1"];
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  xdg.menus.enable = true;
  services.dbus.enable = true;
}
