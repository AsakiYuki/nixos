{
  inputs,
  libs,
  pkgs,
  config,
  lib,
  plgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./mount.nix
    (libs.root "/host/desktop/default.nix")
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Ho_Chi_Minh";
  nixpkgs.config.allowUnfree = true;

  boot.kernelParams = ["amd_pstate=active" "nowatchdog" "modprobe.blacklist=sp5100_tco"];
  boot.kernelModules = ["ideapad_laptop"];
  boot.supportedFilesystems = ["ntfs"];
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = [config.boot.kernelPackages.zenpower];

  boot.loader.systemd-boot.configurationLimit = 5;

  hardware.graphics = let
    pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    package = pkgs-unstable.mesa;
    package32 = pkgs-unstable.pkgsi686Linux.mesa;
    enable32Bit = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.settings.auto-optimise-store = true;

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  fileSystems."/mnt/win-efi" = {
    device = "/dev/disk/by-uuid/0000-31FA";
    fsType = "vfat";
    options = ["ro" "nofail" "x-systemd.automount" "x-systemd.idle-timeout=60"];
  };

  systemd.services.sync-windows-bootloader = {
    description = "Sync Windows bootloader to Linux ESP";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.rsync}/bin/rsync -a --delete /mnt/win-efi/EFI/Microsoft/ /boot/EFI/Microsoft/";
    };
  };

  systemd.paths.sync-windows-bootloader = {
    description = "Watch Windows EFI for bootloader changes";
    pathConfig = {
      PathChanged = "/mnt/win-efi/EFI/Microsoft/Boot/bootmgfw.efi";
      Unit = "sync-windows-bootloader.service";
    };
    wantedBy = ["multi-user.target"];
  };

  services.power-profiles-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    lm_sensors
    ryzenadj
    sbctl
    rsync
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.asakiyuki.home = {
    sessionVariables = {
      QML_IMPORT_PATH = "/run/current-system/sw/lib/qt-6/qml";
    };
  };

  system.stateVersion = "25.11";
}
