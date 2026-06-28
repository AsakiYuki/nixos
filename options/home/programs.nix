{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  cfg = config.programs;
  getPkg = name: lib.mkIf cfg.${name}.enable cfg.${name}.package;
in {
  imports = [
    ./programs/dolphin
    ./programs/kde
  ];

  config.home.packages =
    [
      (getPkg "catppuccin")
      (getPkg "poppler-utils")
      (getPkg "tor-browser")
      (getPkg "img2pdf")
      (getPkg "qpdf")
      (getPkg "ladybird")
      (getPkg "android-tools")
      (getPkg "android-studio")
      (getPkg "rustup")
      (getPkg "ghidra")
      (getPkg "qbittorrent")
      (lib.mkIf cfg.jetbrains.idea.enable cfg.jetbrains.idea.package)
      (lib.mkIf cfg.jetbrains.datagrip.enable cfg.jetbrains.datagrip.package)
      (getPkg "zen-browser")
      (getPkg "mangohud")
      (getPkg "telegram")
      (getPkg "vlc")
      (getPkg "gimp")
      (getPkg "libreoffice")
      (getPkg "osu")
      (getPkg "lmstudio")
      (getPkg "blender")
      (getPkg "xprop")
      (getPkg "davinci-resolve")
      (getPkg "wl-clipboard")
      (getPkg "easyeffects")

      (getPkg "pavucontrol")
      (getPkg "nwg-look")
      (getPkg "tldr")

      (getPkg "hytale-launcher")
      (getPkg "cider")
    ]
    ++ (lib.optionals cfg.proton-ge.enable cfg.proton-ge.packages)
    ++ (lib.optionals cfg.proton-apps.enable cfg.proton-apps.packages);

  config.programs.yt-dlp.extraConfig = let
    cfg = config.programs.yt-dlp.output;
  in ''
    -o ${config.home.homeDirectory}/${cfg.directory}/${cfg.format}
  '';

  options.programs = {
    yt-dlp = {
      output = {
        directory = lib.mkOption {
          type = lib.types.str;
          default = "Downloads/yt-dlp";
        };
        format = lib.mkOption {
          type = lib.types.str;
          default = "%(title)s.%(ext)s";
        };
      };
    };

    qbittorrent = {
      enable = lib.mkEnableOption "qbittorrent";
      package = lib.mkPackageOption pkgs "qbittorrent" {};
    };

    tor-browser = {
      enable = lib.mkEnableOption "tor-browser";
      package = lib.mkPackageOption pkgs "tor-browser" {};
    };

    qpdf = {
      enable = lib.mkEnableOption "qpdf";
      package = lib.mkPackageOption pkgs "qpdf" {};
    };

    ladybird = {
      enable = lib.mkEnableOption "ladybird";
      package = lib.mkPackageOption pkgs "ladybird" {};
    };

    poppler-utils = {
      enable = lib.mkEnableOption "poppler-utils";
      package = lib.mkPackageOption pkgs "poppler-utils" {};
    };

    img2pdf = {
      enable = lib.mkEnableOption "img2pdf";
      package = lib.mkPackageOption pkgs "img2pdf" {};
    };

    android-tools = {
      enable = lib.mkEnableOption "android-tools";
      package = lib.mkPackageOption pkgs "android-tools" {};
    };

    android-studio = {
      enable = lib.mkEnableOption "android-studio";
      package = lib.mkPackageOption pkgs "android-studio" {};
    };

    rustup = {
      enable = lib.mkEnableOption "rustup";
      package = lib.mkPackageOption pkgs "rustup" {};
    };

    ghidra = {
      enable = lib.mkEnableOption "ghidra";
      package = lib.mkPackageOption pkgs "ghidra" {};
    };

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
    tldr = {
      enable = lib.mkEnableOption "tldr";
      package = lib.mkPackageOption pkgs "tldr" {};
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
    hytale-launcher = {
      enable = lib.mkEnableOption "hytale-launcher";
      package = lib.mkOption {
        type = lib.types.package;
        default = inputs.hytale-launcher.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    };
    cider = {
      enable = lib.mkEnableOption "cider-2";
      package = lib.mkPackageOption pkgs "cider-2" {};
    };
  };
}
