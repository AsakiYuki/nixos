{ pkgs, ... }:
{
    boot.loader = {
        systemd-boot.enable = false;
        grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
        extraEntries = '''';
        default = 2;
        theme = pkgs.stdenv.mkDerivation {
            pname = "cerydra-grub-theme";
            version = "1.0.0";
            src = pkgs.fetchzip {
                url = "https://github.com/voidlhf/StarRailGrubThemes/releases/download/20250815-102435/Cerydra.tar.gz";
                hash = "sha256-zl5tL4AkqkuFFMRPmD9oSGrSiIYYu30k6ie32nv9Gd4=";
            };
            buildInputs = [ pkgs.imagemagick ];
            installPhase = ''
                mkdir -p $out
                cp -r $src/* $out
                cp $out/background.png background.png
                rm $out/background.png
                magick background.png -resize 1920x1200^ -gravity west -extent 1920x1200 background.png
                cp background.png $out
            '';
            };
        };
        efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot";
        };
    };
}