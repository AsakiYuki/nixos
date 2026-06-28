{
  libs,
  inputs,
  ...
}: {
  imports = [
    ./programs
    ./virtualisation.nix
    ./device.nix
    ./services
    ./home

    (libs.root "/modules/fonts.nix")
    (libs.root "/users/asakiyuki/configuration.nix")

    inputs.aagl.nixosModules.default
  ];
  i18n.inputMethod.enable = true;
  boot.kernelParams = ["usbcore.autosuspend=-1"];
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  xdg.menus.enable = true;
  services.dbus.enable = true;
}
