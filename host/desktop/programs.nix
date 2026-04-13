{...}: {
  programs = {
    ffmpeg.enable = true;
    nodejs.enable = true;
    bun.enable = true;
    brightnessctl.enable = true;
    php.enable = true;
    ntfs3g.enable = true;
    python.enable = true;
    jdk.enable = true;
    winepackages.enable = true;
    quickshell.enable = true;
    papirus-icons.enable = true;
    kde-packages.enable = true;
    r-tensorflow.enable = true;
    hyprland-portals.enable = true;
  };

  home-manager.users.asakiyuki.programs = {
    lutris.enable = true;
    hyprshot.enable = true;
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
    firefox.enable = true;
    chromium.enable = true;
    gcc.enable = true;
  };
}
