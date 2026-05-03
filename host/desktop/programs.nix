{
  unstable,
  inputs,
  ...
}: {
  imports = [
    inputs.aagl.nixosModules.default
  ];

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
    lsfg-vk.enable = true;
    lsfg-vk-ui.enable = true;
    cava.enable = true;
    gamemode.enable = true;
    gamescope.enable = true;
    honkers-railway-launcher.enable = true;
  };

  programs.ssh.extraConfig = ''
    Host server
      HostName server.asakiyuki.com
      User asakiyuki
      Port 15523
  '';

  home-manager.users.asakiyuki.programs = {
    jetbrains = {
      idea.enable = true;
      datagrip.enable = true;
    };

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
    hytale.enable = true;
    cider.enable = true;
    proton-ge.enable = true;
    proton-apps.enable = true;
    firefox.enable = true;
    chromium.enable = true;
    gcc.enable = true;
    davinci-resolve.enable = true;
    wl-clipboard.enable = true;
    telegram.enable = true;
    zen-browser.enable = true;

    lmstudio = {
      enable = true;
      package = unstable.lmstudio;
    };
  };
}
