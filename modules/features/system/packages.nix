{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    tree
    screen

    nixd
    alejandra

    p7zip-rar

    kdePackages.kio-extras
    kdePackages.kio-fuse
  ];
}
