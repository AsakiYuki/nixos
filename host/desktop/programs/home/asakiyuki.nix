{
  pkgs,
  custom,
  ...
}: {
  programs = {
    jetbrains = {
      idea.enable = true;
      datagrip.enable = true;
    };

    nixcord = {
      enable = true;
      discord.enable = true;
      discord.vencord.enable = true;
    };

    nixvim.enable = true;
    fzf.enable = true;
    git.enable = true;
    tmux.enable = true;
    fastfetch.enable = true;
    starship.enable = true;
    bash.enable = true;
    ghostty.enable = true;
    kitty.enable = true;
    tor-browser.enable = true;
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
