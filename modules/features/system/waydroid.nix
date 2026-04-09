{ pkgs, lib, config, ... }: {
    virtualisation.waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
    };

    environment.systemPackages = lib.optionals config.virtualisation.waydroid.enable [
        pkgs.waydroid-helper
    ];
}