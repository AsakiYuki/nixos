{ lib, ... }: {
    options.device = {
        symlink = lib.mkOption {
            default = {};
            type = lib.type.attrsOf lib.types.str;
        };
    };
}