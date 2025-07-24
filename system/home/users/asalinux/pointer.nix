{ pkgs }:
let
    fetchCursor = url: hash: name: {
        gtk.enable = true;
        x11 = true;
        size = 48;
        package = pkgs.runCommand "moveUp" {} ''
            mkdir -p $out/share/icons
            ln -s ${pkgs.fetchZip {
                url = url;
                hash = hash;
            }} $out/share/icons/${name}
        '';
    };
in fetchCursor
    "https://www.asakiyuki.com/linux/theme/cursors/castorice.zip"
    "14aq443kj7ivlawdcipi0k4bi256ih2d4wqdh9p469v80sx0id6h"
    "castorice-cursors";