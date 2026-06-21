{
  inputs,
  custom,
  pkgs,
  ...
}: {
  imports = [inputs.aagl.nixosModules.default];

  virtualisation.vmware.host.enable = true;

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    ssh.extraConfig = ''
      Host server
        HostName asakiyuki.com
        User asakiyuki
        Port 15523
    '';

    llvm.enable = true;
    ffmpeg.enable = true;
    nodejs.enable = true;
    bun.enable = true;
    brightnessctl.enable = true;
    ntfs3g.enable = true;
    python.enable = true;
    jdk.enable = true;
    winepackages.enable = true;
    papirus-icons.enable = true;
    kde-packages.enable = true;
    r-tensorflow.enable = true;
    lsfg-vk.enable = true;
    lsfg-vk-ui.enable = true;
    cava.enable = true;
    gamemode.enable = true;
    gamescope.enable = true;
    quickshell.enable = true;
    hyprland-portals.enable = true;
  };

  home-manager.users.asakiyuki.programs = {
    jetbrains = {
      idea.enable = true;
      datagrip.enable = true;
    };

    yt-dlp.enable = true;
    poppler-utils.enable = true;
    img2pdf.enable = true;
    qpdf.enable = true;
    ladybird.enable = true;
    android-studio.enable = true;
    android-tools.enable = true;
    ghidra.enable = true;
    rustup.enable = true;
    qbittorrent.enable = true;
    easyeffects.enable = true;
    zed-editor.enable = true;
    dolphin.enable = true;
    mangohud.enable = true;
    bluetuith.enable = true;
    lutris.enable = true;
    hyprshot.enable = true;
    catppuccin.enable = true;
    antigravity.enable = true;
    prismlauncher.enable = true;
    vlc.enable = true;
    gimp.enable = true;
    libreoffice.enable = true;
    osu.enable = true;
    blender.enable = true;
    xprop.enable = true;
    pavucontrol.enable = true;
    nwg-look.enable = true;
    hytale-launcher.enable = true;
    proton-ge.enable = true;
    proton-apps.enable = true;
    firefox.enable = true;
    chromium.enable = true;
    gcc.enable = true;
    davinci-resolve.enable = true;
    wl-clipboard.enable = true;
    telegram.enable = true;
    zen-browser.enable = true;
    tldr.enable = true;
    obs-studio.enable = true;

    cider = {
      enable = true;
      package = pkgs.callPackage custom.cider-2 {};
    };

    lmstudio = {
      enable = true;
      package = pkgs.lmstudio;
    };

    vscode = {
      enable = true;
      package = pkgs.vscode;
    };
  };
}
