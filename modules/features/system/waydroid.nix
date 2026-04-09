{ pkgs, lib, config, ... }: {
    virtualisation.waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
    };

    environment.systemPackages = lib.mkOptionals config.virtualisation.waydroid.enable [
        waydroid-helper
    ];
}