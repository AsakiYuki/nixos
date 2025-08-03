{ pkgs, ... }:
{
    enable = true;

    generatedConfigs = {
        viml = ''
            set tabstop=4
            set shiftwidth=4
            set expandtab
        '';

        lua = ''
            vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>", { silent = true })
        '';
    };

    extraConfig = ''
        set tabstop=4
        set shiftwidth=4
        set expandtab
    '';

    extraLuaConfig = ''
        vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>", { silent = true })
    '';

    plugins = with pkgs.vimPlugins; [
        neo-tree-nvim
        {
            plugin = catppuccin-nvim;
            config = "colorscheme catppuccin";
        }
    ];
}
