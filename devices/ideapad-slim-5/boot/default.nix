{
  pkgs,
  lib,
  # inputs,
  ...
}: {
  boot = {
    supportedFilesystems = ["ntfs"];
    # kernelPackages = pkgs.linuxPackagesFor inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.linux_cachyos;
    kernelPackages = pkgs.linuxPackages_cachyos;
    # extraModulePackages = [config.boot.kernelPackages.zenpower];

    kernelParams = [
      "amd_pstate=active"
      "nowatchdog"
      "modprobe.blacklist=sp5100_tco"
    ];

    # kernelPatches = [
    #   {
    #     name = "waydroid-add-dmabuf";
    #     patch = null;
    #     structuredExtraConfig = with lib.kernel; {
    #       DMABUF_HEAPS = yes;
    #       DMABUF_HEAPS_SYSTEM = yes;
    #     };
    #   }
    # ];

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
