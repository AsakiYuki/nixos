{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ./programs/dolphin/imports.nix
    ./programs/kde/imports.nix
  ];

  config.home.packages =
    [
      (lib.mkIf config.programs.catppuccin.enable config.programs.catppuccin.package)

      (lib.mkIf config.programs.antigravity.enable config.programs.antigravity.package)
      (lib.mkIf config.programs.jetbrains.idea.enable config.programs.jetbrains.idea.package)
      (lib.mkIf config.programs.jetbrains.datagrip.enable config.programs.jetbrains.datagrip.package)
      (lib.mkIf config.programs.zen-browser.enable config.programs.zen-browser.package)
      (lib.mkIf config.programs.mangohud.enable config.programs.mangohud.package)
      (lib.mkIf config.programs.telegram.enable config.programs.telegram.package)
      (lib.mkIf config.programs.prismlauncher.enable config.programs.prismlauncher.package)
      (lib.mkIf config.programs.vlc.enable config.programs.vlc.package)
      (lib.mkIf config.programs.gimp.enable config.programs.gimp.package)
      (lib.mkIf config.programs.libreoffice.enable config.programs.libreoffice.package)
      (lib.mkIf config.programs.osu.enable config.programs.osu.package)
      (lib.mkIf config.programs.lmstudio.enable config.programs.lmstudio.package)
      (lib.mkIf config.programs.blender.enable config.programs.blender.package)
      (lib.mkIf config.programs.xprop.enable config.programs.xprop.package)
      (lib.mkIf config.programs.davinci-resolve.enable config.programs.davinci-resolve.package)
      (lib.mkIf config.programs.wl-clipboard.enable config.programs.wl-clipboard.package)
      (lib.mkIf config.programs.easyeffects.enable config.programs.easyeffects.package)

      (lib.mkIf config.programs.pavucontrol.enable config.programs.pavucontrol.package)
      (lib.mkIf config.programs.nwg-look.enable config.programs.nwg-look.package)

      (lib.mkIf config.programs.hytale.enable config.programs.hytale.package)
      (lib.mkIf config.programs.cider.enable config.programs.cider.package)
    ]
    ++ (lib.optionals config.programs.proton-ge.enable config.programs.proton-ge.packages)
    ++ (lib.optionals config.programs.proton-apps.enable config.programs.proton-apps.packages);

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
    jetbrains = {
      datagrip = {
        enable = lib.mkEnableOption "datagrip";
        package = lib.mkPackageOption pkgs.jetbrains "datagrip" {};
      };
      idea = {
        enable = lib.mkEnableOption "idea";
        package = lib.mkPackageOption pkgs.jetbrains "idea" {};
      };
    };
    zen-browser = {
      enable = lib.mkEnableOption "zen-browser";
      package = lib.mkPackageOption inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system} "default" {};
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
    easyeffects = {
      enable = lib.mkEnableOption "Easy Effects";
      package = lib.mkPackageOption pkgs "easyeffects" {};
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
    telegram = {
      enable = lib.mkEnableOption "telegram-desktop";
      package = lib.mkPackageOption pkgs "telegram-desktop" {};
    };
    lmstudio = {
      enable = lib.mkEnableOption "lmstudio";
      package = lib.mkPackageOption pkgs "lmstudio" {};
    };
    wl-clipboard = {
      enable = lib.mkEnableOption "wl-clipboard";
      package = lib.mkPackageOption pkgs "wl-clipboard" {};
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
