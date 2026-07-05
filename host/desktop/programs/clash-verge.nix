{pkgs, ...}: {
  programs.clash-verge = {
    enable = true;
    package = pkgs.clash-verge-rev;
    autoStart = true;
    tunMode = true;
    serviceMode = true;
  };
}
