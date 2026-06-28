{
  pkgs,
  config,
  lib,
  ...
}: {
  boot = {
    supportedFilesystems = ["ntfs"];
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = [config.boot.kernelPackages.zenpower];

    kernelParams = [
      "amd_pstate=active"
      "nowatchdog"
      "modprobe.blacklist=sp5100_tco"
    ];

    loader = {
      systemd-boot.configurationLimit = 5;
      systemd-boot.enable = lib.mkForce false;
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
