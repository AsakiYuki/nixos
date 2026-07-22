{...}: {
  programs.nixvim = {
    imports = [
      ./keymaps
      ./plugins
      ./lua

      ./extra-packages.nix
      ./settings.nix
    ];
  };
}
