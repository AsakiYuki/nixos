{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    vim
    btop
    wget
    tree
    screen

    nixd
    alejandra

    zip
    unzip
    p7zip-rar

    kdePackages.kio-extras
    kdePackages.kio-fuse
  ];
}
