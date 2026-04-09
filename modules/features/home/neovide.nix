{ ... }: {
    programs.neovide = {
        enable = true;
        settings = {
            neovim-bin = "/etc/profiles/per-user/asakiyuki/bin/nvim";
        };
    };
}