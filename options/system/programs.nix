{
  lib,
  config,
  pkgs,
  custom,
  ...
}: {
  config.environment.systemPackages =
    [
      (lib.mkIf config.virtualisation.waydroid.enable (pkgs.callPackage (custom.cage-xtmapper {}) {}))

      (lib.mkIf config.programs.ffmpeg.enable config.programs.ffmpeg.package)
      (lib.mkIf config.programs.lsfg-vk.enable config.programs.lsfg-vk.package)
      (lib.mkIf config.programs.lsfg-vk-ui.enable config.programs.lsfg-vk-ui.package)
      (lib.mkIf config.programs.nodejs.enable config.programs.nodejs.package)
      (lib.mkIf config.programs.bun.enable config.programs.bun.package)
      (lib.mkIf config.programs.brightnessctl.enable config.programs.brightnessctl.package)
      (lib.mkIf config.programs.php.enable config.programs.php.package)
      (lib.mkIf config.programs.ntfs3g.enable config.programs.ntfs3g.package)
      (lib.mkIf config.programs.python.enable config.programs.python.package)
      (lib.mkIf config.programs.jdk.enable config.programs.jdk.package)

      (lib.mkIf config.programs.quickshell.enable config.programs.quickshell.package)
      (lib.mkIf config.programs.papirus-icons.enable config.programs.papirus-icons.package)
    ]
    ++ lib.concatLists [
      (lib.optionals config.programs.gcc.enable config.programs.gcc.packages)
      (lib.optionals config.programs.winepackages.enable config.programs.winepackages.packages)
      (lib.optionals config.programs.kde-packages.enable config.programs.kde-packages.packages)
      (lib.optionals config.programs.r-tensorflow.enable [config.programs.r-tensorflow.package])
      (lib.optionals (
          config.programs.hyprland-portals.enable && config.device.wm.hyprland.enable
        )
        config.programs.hyprland-portals.packages)
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
    php = {
      enable = lib.mkEnableOption "php";
      package = lib.mkPackageOption pkgs "php" {};
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
          xdg-desktop-portal-wlr
          xdg-desktop-portal-hyprland
        ];
      };
    };
  };
}
