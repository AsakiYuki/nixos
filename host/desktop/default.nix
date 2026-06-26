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

  boot.kernelParams = ["usbcore.autosuspend=-1"];
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  xdg.menus.enable = true;
  services.dbus.enable = true;
}
