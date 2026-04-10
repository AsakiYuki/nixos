{ lib, ... }: {
    options.device = {
        symlink = lib.mkOption {
            default = {};
            type = lib.types.attrsOf lib.types.str;
        };
    };
}