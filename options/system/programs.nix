{ lib, pkgs, ... }:
{
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
    wget = {
      enable = lib.mkEnableOption "wget";
      package = lib.mkPackageOption pkgs "wget" { };
    };
    tree = {
      enable = lib.mkEnableOption "tree";
      package = lib.mkPackageOption pkgs "tree" { };
    };
    ffmpeg = {
      enable = lib.mkEnableOption "ffmpeg";
      package = lib.mkPackageOption pkgs "ffmpeg-full" { };
    };
    nodejs = {
      enable = lib.mkEnableOption "nodejs";
      package = lib.mkPackageOption pkgs "nodejs" { };
    };
    bun = {
      enable = lib.mkEnableOption "bun";
      package = lib.mkPackageOption pkgs "bun" { };
    };
    brightnessctl = {
      enable = lib.mkEnableOption "brightnessctl";
      package = lib.mkPackageOption pkgs "brightnessctl" { };
    };
    php = {
      enable = lib.mkEnableOption "php";
      package = lib.mkPackageOption pkgs "php" { };
    };
    ntfs3g = {
      enable = lib.mkEnableOption "ntfs3g";
      package = lib.mkPackageOption pkgs "ntfs3g" { };
    };
    zip = {
      enable = lib.mkEnableOption "zip";
      package = lib.mkPackageOption pkgs "zip" { };
    };
    unzip = {
      enable = lib.mkEnableOption "unzip";
      package = lib.mkPackageOption pkgs "unzip" { };
    };
    python = {
      enable = lib.mkEnableOption "python";
      package = lib.mkPackageOption pkgs "python3" { };
    };
    jdk = {
      enable = lib.mkEnableOption "jdk-25";
      package = lib.mkPackageOption pkgs "jdk25" { };
    };
    nixfmt = {
      enable = lib.mkEnableOption "nixfmt";
      package = lib.mkPackageOption pkgs "nixfmt" { };
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
      package = lib.mkPackageOption pkgs "quickshell" { };
    };
    papirus-icons = {
      enable = lib.mkEnableOption "papirus-icon-theme";
      package = lib.mkPackageOption pkgs "papirus-icon-theme" { };
    };
    kde-packages = {
      enable = lib.mkEnableOption "KDE utility packages";
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs.kdePackages; [
          kservice
          dolphin
          kate
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
