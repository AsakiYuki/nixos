{pkgs, ...}: {
  programs = {
    cider = {
      enable = true;
      package = pkgs.cider-2;
    };
  };
}
