{
  libs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./mount.nix
    ./network.nix
    (libs.root "/host/desktop/default.nix")
  ];

  time.timeZone = "Asia/Ho_Chi_Minh";
  nixpkgs.config.allowUnfree = true;

  boot = {
    kernelParams = ["amd_pstate=active" "nowatchdog" "modprobe.blacklist=sp5100_tco"];
    supportedFilesystems = ["ntfs"];
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = [config.boot.kernelPackages.zenpower];

    loader = {
      systemd-boot.configurationLimit = 5;
      systemd-boot.enable = lib.mkForce false;
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };

  hardware = {
    amdgpu.initrd.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  systemd = {
    services.sync-windows-bootloader = {
      description = "Sync Windows bootloader to Linux ESP";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.rsync}/bin/rsync -a --delete /mnt/win-efi/EFI/Microsoft/ /boot/EFI/Microsoft/";
      };
    };

    paths.sync-windows-bootloader = {
      description = "Watch Windows EFI for bootloader changes";
      pathConfig = {
        PathChanged = "/mnt/win-efi/EFI/Microsoft/Boot/bootmgfw.efi";
        Unit = "sync-windows-bootloader.service";
      };
      wantedBy = ["multi-user.target"];
    };
  };

  services = {
    power-profiles-daemon.enable = true;
    xserver.videoDrivers = ["amdgpu"];
  };

  environment = {
    etc = {
      "usr/share/hypr".source = pkgs.hyprland.outPath + "/share/hypr/";
    };

    variables = {
      QML_IMPORT_PATH = "/run/current-system/sw/lib/qt-6/qml";
      QML2_IMPORT_PATH = "/etc/profiles/per-user/asakiyuki/lib/qt-6/qml";
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  environment.systemPackages = with pkgs; [
    # php btw
    php85
    php85Packages.composer
    intelephense

    lm_sensors
    ryzenadj
    sbctl
    rsync
  ];

  device.wm.hyprland.extraConfig = builtins.readFile ./hyprland.lua;
}
