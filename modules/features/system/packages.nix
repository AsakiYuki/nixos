{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    vim
    file
    wget
    tree
    screen

    nixfmt
    nixd

    alejandra

    p7zip-rar

    kdePackages.kio-extras
    kdePackages.kio-fuse
  ];
}
