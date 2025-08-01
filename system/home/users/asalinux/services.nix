{ ... }:
{
    services = {
        hyprpaper = import ./services/hyprpaper.nix {};
        hypridle = import ./services/hypridle.nix {};
    };
}