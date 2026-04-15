{
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./programs/dolphin.nix
  ];

  options.programs = {
    catppuccin = {
      enable = lib.mkEnableOption "catppuccin";
      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.catppuccin-gtk.override {
          variant = "mocha";
          accents = ["sapphire"];
          size = "compact";
        };
        description = "Catppuccin GTK package";
      };
      kde = lib.mkOption {
        type = lib.types.package;
        default = pkgs.catppuccin-kde.override {
          flavour = ["mocha"];
          accents = ["sapphire"];
        };
        description = "Catppuccin KDE package";
      };
    };
    antigravity = {
      enable = lib.mkEnableOption "antigravity";
      package = lib.mkPackageOption pkgs "antigravity" {};
    };
    prismlauncher = {
      enable = lib.mkEnableOption "prismlauncher";
      package = lib.mkPackageOption pkgs "prismlauncher" {};
    };
    proton-ge = {
      enable = lib.mkEnableOption "proton-ge utils";
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs; [
          protonup-qt
          protonplus
        ];
      };
    };
    vlc = {
      enable = lib.mkEnableOption "vlc";
      package = lib.mkPackageOption pkgs "vlc" {};
    };
    gimp = {
      enable = lib.mkEnableOption "gimp";
      package = lib.mkPackageOption pkgs "gimp" {};
    };
    libreoffice = {
      enable = lib.mkEnableOption "libreoffice";
      package = lib.mkPackageOption pkgs "libreoffice-qt-fresh" {};
    };
    osu = {
      enable = lib.mkEnableOption "osu-lazer";
      package = lib.mkPackageOption pkgs "osu-lazer-bin" {};
    };
    lmstudio = {
      enable = lib.mkEnableOption "lmstudio";
      package = lib.mkPackageOption pkgs "lmstudio" {};
    };
    blender = {
      enable = lib.mkEnableOption "blender";
      package = lib.mkPackageOption pkgs "blender" {};
    };
    xprop = {
      enable = lib.mkEnableOption "xprop";
      package = lib.mkPackageOption pkgs "xprop" {};
    };
    pavucontrol = {
      enable = lib.mkEnableOption "pavucontrol-qt";
      package = lib.mkPackageOption pkgs.lxqt "pavucontrol-qt" {};
    };
    nwg-look = {
      enable = lib.mkEnableOption "nwg-look";
      package = lib.mkPackageOption pkgs "nwg-look" {};
    };
    proton-apps = {
      enable = lib.mkEnableOption "proton-pass and proton-authenticator";
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs; [
          proton-pass
          proton-authenticator
        ];
      };
    };
    davinci-resolve = {
      enable = lib.mkEnableOption "davinci-resolve";
      package = lib.mkPackageOption pkgs "davinci-resolve" {};
    };
    hytale = {
      enable = lib.mkEnableOption "hytale-launcher";
      package = lib.mkOption {
        type = lib.types.package;
        default = inputs.hytale-launcher.packages.${pkgs.system}.default;
      };
    };
    cider = {
      enable = lib.mkEnableOption "cider-2";
      package = lib.mkPackageOption pkgs "cider-2" {};
    };
  };
}
