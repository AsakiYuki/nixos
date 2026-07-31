{ unstable, ... }: {
  programs.nixvim = {
    _module.args = { inherit unstable; };

    imports = [
      ./keymaps
      ./plugins
      ./lua

      ./extra-packages.nix
      ./settings.nix
    ];
  };
}
