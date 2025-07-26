{ ... }:
{
    enable = true;
    settings = {
        logo = {
            width = 12;
            height = 12;
        };

        display = {
            color =  {
                title =  "#cdd6f4";
                keys =  "#bac2de";
                output =  "#7f849c";
                separator =  "black";
            };
            brightColor =  true;
        };

        general = {};

        modules = [
            "title"
            "separator"
            "os"
            "host"
            "kernel"
            "uptime"
            "packages"
            "de"
            "wm"
            "display"
            "cpu"
            "gpu"
            "memory"
            "swap"
            "disk"
            "break"
            "colors"
        ];
    };
}