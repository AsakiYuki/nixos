{pkgs, ...}: {
  programs.nixvim = {
    nixpkgs.source = pkgs.path;
    imports = [
      ./extra-packages.nix

      ./keymaps/_keymaps.nix

      ./plugins/_plugins.nix
      ./plugins/_extraPlugins.nix

      ./lua/_lua.nix
    ];
  };
}
