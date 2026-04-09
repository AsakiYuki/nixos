{ inputs, pkgs, libs, ... }: let
    background = libs.root "/assets/grub/background.png";
    baseTheme = inputs.honkai-railway-grub-theme.packages.${pkgs.stdenv.hostPlatform.system}.cyrene-grub-theme;
in {
    boot = {
        loader = {
            efi.canTouchEfiVariables = true;

            grub = rec {
                enable = true;
                device = "nodev";
                efiSupport = true;
                useOSProber = true;
                splashImage = background;
                theme = pkgs.runCommand "my-grub-theme" { } ''
                    mkdir -p $out
                    cp -r ${baseTheme}/* $out/
                    chmod -R u+w $out
                    cp ${background} $out/background.png
                '';
            };
        };
    };
}