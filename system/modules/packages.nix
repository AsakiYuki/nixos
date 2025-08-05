{ inputs, pkgs, unstable, ... }:
let
    catppuccin-gtk = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "blue" ];
        size = "compact";
    };

    vesktop = pkgs.vesktop.overrideAttrs ({
        postFixup = ''
            makeWrapper ${pkgs.electron}/bin/electron $out/bin/vesktop \
                --add-flags $out/opt/Vesktop/resources/app.asar \
                --add-flags "--ozone-platform=x11"
        '';
    });
in
{
    environment.systemPackages = with pkgs; [
        # Softwares
        kitty
        ghostty
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
        gimp
        lxqt.lximage-qt
        gfn-electron
        prismlauncher
        chromium
	youtube-music

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
        nwg-look
        catppuccin-gtk
        flatpak-builder
        
        # Hyprland
        hyprshot
        hyprpaper
 
        # CLI
        cloudflared
        vim
        btop
        wget
        ffmpeg
        killall
        ntfs3g
        playerctl
        p7zip
        fastfetch
        tldr
        fzf
	    waydroid-helper
        lazydocker

        # KDE
        kdePackages.dolphin
        kdePackages.kate
        kdePackages.qt5compat
        kdePackages.qtdeclarative
        kdePackages.qtimageformats
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.plasma-workspace
        kdePackages.kservice
        kdePackages.dolphin-plugins

        # Unstable Packages
        unstable.quickshell
        unstable.proton-pass
    ];
}
