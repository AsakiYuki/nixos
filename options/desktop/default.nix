{ lib, ... }: {
    imports = [
        ../common/default.nix

        ./environment.nix
        ./programs.nix
        ./hardware.nix
        ./file.nix
    ];

    options.device = {
        cursors = lib.mkOption {
            type = lib.types.str;
            default = "aemeath";
            description = "Cursor theme to use for the desktop";
        };
    };
}