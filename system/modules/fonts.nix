{ pkgs, ... }: let
tahoma = pkgs.stdenv.mkDerivation {
    pname = "tahoma-custom";
    version = "1.0";
    dontUnpack = true;

    src = pkgs.fetchurl {
        url = "https://www.asakiyuki.com/static/fonts/Tahoma.ttf";
        sha256 = "129l1cprplci2xmxi0gnsjrvprr48xqp8kr5s9lrwcnaxvb4z4ni";
    };

    installPhase = ''
        mkdir -p $out/share/fonts/truetype
        cp $src $out/share/fonts/truetype/
    '';
  };
in {
    fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs; [
        tahoma
        
        # Nerd fonts
        nerd-fonts.sauce-code-pro
    ];
}