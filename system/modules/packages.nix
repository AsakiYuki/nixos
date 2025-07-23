{ pkgs, unstablePkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        # Softwares
        kitty
        lxqt.pavucontrol-qt
        fcitx5
        fcitx5-bamboo
        kdePackages.fcitx5-qt
        kdePackages.fcitx5-unikey
        kdePackages.fcitx5-configtool 
        kdePackages.xwaylandvideobridge
        spotify
        vesktop
        obs-studio

        # Screen sharing
        wireplumber
        pipewire
        xdg-desktop-portal
        xdg-desktop-portal-wlr
        xdg-desktop-portal-hyprland

        # Themes
        kdePackages.breeze-icons
        kdePackages.breeze-gtk
        kdePackages.kdeclarative 
        papirus-icon-theme
        fcitx5-material-color

        # Hyprland
        hyprshot
        hyprpaper
 
        # CLI
        git
        cloudflared
        neovim
        vim
        fastfetch
        btop
        wget
        ffmpeg
        killall

        # KDE
        kdePackages.dolphin
        kdePackages.kate
        kdePackages.qt5compat
        kdePackages.qtdeclarative
        kdePackages.qtimageformats
        kdePackages.qtsvg
        kdePackages.qtmultimedia

        # Unstable Packages
        unstablePkgs.quickshell
        unstablePkgs.spicetify-cli
    ];
}