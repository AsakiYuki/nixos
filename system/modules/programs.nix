{ inputs, ... }:
{
    programs = {
        steam.enable = true;
        
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };
}