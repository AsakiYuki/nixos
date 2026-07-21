{
  pkgs,
  custom,
  ...
}: {
  programs = {
    cider = {
      enable = true;
      package = pkgs.callPackage custom.cider-2 {};
    };
  };
}
