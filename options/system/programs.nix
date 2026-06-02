{
  lib,
  config,
  pkgs,
  custom,
  ...
}: let
  cfg = config.programs;
  getPkg = name: lib.mkIf cfg.${name}.enable cfg.${name}.package;
in {
  config.environment.systemPackages =
    [
      (lib.mkIf config.virtualisation.waydroid.enable (pkgs.callPackage (custom.cage-xtmapper {}) {}))

      (getPkg "ffmpeg")
      (getPkg "cava")
      (getPkg "lsfg-vk")
      (getPkg "lsfg-vk-ui")
      (getPkg "nodejs")
      (getPkg "bun")
      (getPkg "brightnessctl")
      (getPkg "ntfs3g")
      (getPkg "python")
      (getPkg "jdk")

      (getPkg "quickshell")
      (getPkg "papirus-icons")
    ]
    ++ lib.concatLists [
      (lib.optionals cfg.gcc.enable cfg.gcc.packages)
      (lib.optionals cfg.winepackages.enable cfg.winepackages.packages)
      (lib.optionals cfg.kde-packages.enable cfg.kde-packages.packages)
      (lib.optionals cfg.r-tensorflow.enable [cfg.r-tensorflow.package])
      (lib.optionals (cfg.hyprland-portals.enable && config.device.wm.hyprland.enable) cfg.hyprland-portals.packages)
      (lib.optionals cfg.llvm.enable cfg.llvm.packages)
    ];

  options.device.programs = {
    terminal = {
      enable = lib.mkEnableOption "terminal";
      name = lib.mkOption {
        type = lib.types.str;
        default = "ghostty";
        description = "Terminal";
      };
    };

    nixcord.enable = lib.mkEnableOption "nixcord";
    tmux.enable = lib.mkEnableOption "tmux";
    starship.enable = lib.mkEnableOption "starship";
    fastfetch.enable = lib.mkEnableOption "fastfetch";
    steam.enable = lib.mkEnableOption "steam";

    obs-studio.enable = lib.mkEnableOption "Obs Studio";
  };

  options.programs = {
    llvm = {
      enable = lib.mkEnableOption "llvm";
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs.llvmPackages; [llvm clang lld];
      };
    };
    cava = {
      enable = lib.mkEnableOption "cava";
      package = lib.mkPackageOption pkgs "cava" {};
    };
    ffmpeg = {
      enable = lib.mkEnableOption "ffmpeg";
      package = lib.mkPackageOption pkgs "ffmpeg-full" {};
    };
    lsfg-vk = {
      enable = lib.mkEnableOption "lsfg-vk";
      package = lib.mkPackageOption pkgs "lsfg-vk" {};
    };
    lsfg-vk-ui = {
      enable = lib.mkEnableOption "lsfg-vk-ui";
      package = lib.mkPackageOption pkgs "lsfg-vk-ui" {};
    };
    nodejs = {
      enable = lib.mkEnableOption "nodejs";
      package = lib.mkPackageOption pkgs "nodejs" {};
    };
    bun = {
      enable = lib.mkEnableOption "bun";
      package = lib.mkPackageOption pkgs "bun" {};
    };
    brightnessctl = {
      enable = lib.mkEnableOption "brightnessctl";
      package = lib.mkPackageOption pkgs "brightnessctl" {};
    };
    ntfs3g = {
      enable = lib.mkEnableOption "ntfs3g";
      package = lib.mkPackageOption pkgs "ntfs3g" {};
    };
    python = {
      enable = lib.mkEnableOption "python";
      package = lib.mkPackageOption pkgs "python3" {};
    };
    jdk = {
      enable = lib.mkEnableOption "jdk-25";
      package = lib.mkPackageOption pkgs "jdk25" {};
    };
    winepackages = {
      enable = lib.mkEnableOption "Wine and Proton utilities";
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs; [
          wine
          wine64
          winetricks
          protontricks
        ];
      };
    };
    quickshell = {
      enable = lib.mkEnableOption "quickshell";
      package = lib.mkPackageOption pkgs "quickshell" {};
    };
    papirus-icons = {
      enable = lib.mkEnableOption "papirus-icon-theme";
      package = lib.mkPackageOption pkgs "papirus-icon-theme" {};
    };
    kde-packages = {
      enable = lib.mkEnableOption "KDE utility packages";
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs.kdePackages; [
          kservice
          kate
          gwenview
          qt5compat
          qtdeclarative
          qtimageformats
          qtsvg
          qtmultimedia
          kde-gtk-config
          kirigami
          ksvg
          qtbase
          plasma5support
          qttools
          plasma-sdk
        ];
      };
    };
    r-tensorflow = {
      enable = lib.mkEnableOption "R tensorflow";
      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.rPackages.tensorflow;
      };
    };
    gcc = {
      enable = lib.mkEnableOption "c";
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs; [
          gcc
        ];
      };
    };
    hyprland-portals = {
      enable = lib.mkEnableOption "XDGP for hyprland";
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs; [
          xdg-desktop-portal
          xdg-desktop-portal-gtk
          xdg-desktop-portal-hyprland
        ];
      };
    };
  };
}
