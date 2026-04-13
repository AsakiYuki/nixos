{
  config,
  pkgs,
  ...
}:
{
  programs = {
    wget.enable = true;
    tree.enable = true;
    ffmpeg.enable = true;
    nodejs.enable = true;
    bun.enable = true;
    brightnessctl.enable = true;
    php.enable = true;
    ntfs3g.enable = true;
    zip.enable = true;
    unzip.enable = true;
    python.enable = true;
    jdk.enable = true;
    nixfmt.enable = true;
    winepackages.enable = true;
    quickshell.enable = true;
    papirus-icons.enable = true;
    kde-packages.enable = true;
    r-tensorflow.enable = true;
    hyprland-portals.enable = true;
  };

  home-manager.users.asakiyuki.programs = {
    catppuccin.enable = true;
    antigravity.enable = true;
    prismlauncher.enable = true;
    vlc.enable = true;
    gimp.enable = true;
    libreoffice.enable = true;
    osu.enable = true;
    lmstudio.enable = true;
    blender.enable = true;
    xprop.enable = true;
    pavucontrol.enable = true;
    nwg-look.enable = true;
    hytale.enable = true;
    cider.enable = true;
    proton-ge.enable = true;
    proton-apps.enable = true;
  };
}
