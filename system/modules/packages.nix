{ inputs, pkgs, unstablePkgs, ... }:
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
        lxqt.pavucontrol-qt
        fcitx5
        fcitx5-bamboo
        kdePackages.fcitx5-qt
        kdePackages.fcitx5-unikey
        kdePackages.fcitx5-configtool 
        kdePackages.xwaylandvideobridge
        spotify
        vesktop
        proton-pass
        obs-studio
        gimp
        lxqt.lximage-qt

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

        # Hyprland
        hyprshot
        hyprpaper
 
        # CLI
        cloudflared
        neovim
        vim
        btop
        wget
        ffmpeg
        killall
        ntfs3g
        playerctl
        p7zip
        fastfetch
	    waydroid-helper

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
        unstablePkgs.quickshell
        
        # Flake Packages
        inputs.zen-browser.packages."${system}".default
    ];
}
