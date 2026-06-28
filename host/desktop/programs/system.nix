{...}: {
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

    steam = {
      enable = true;
      allowSteamlinkPorts = true;
      allowMultiplayerPorts = true;
    };

    dconf.enable = true;
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
    direnv.enable = true;
  };
}
