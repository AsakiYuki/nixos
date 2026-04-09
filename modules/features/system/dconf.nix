{ lib, config, pkgs, ... }: {
    programs.dconf.enable = true;
    environment.systemPackages = lib.optionals config.programs.dconf.enable [
        pkgs.glib
    ];
}