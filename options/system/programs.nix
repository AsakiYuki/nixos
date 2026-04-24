{
  lib,
  pkgs,
  ...
}: {
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
    cider-2.enable = lib.mkEnableOption "Cider 2";
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
