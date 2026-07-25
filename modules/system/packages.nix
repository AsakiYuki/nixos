{
  pkgs,
  custom,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    vim
    file
    wget
    tree
    screen

    nixfmt
    nixd
    nil

    alejandra

    p7zip-rar

    kdePackages.kio-extras
    kdePackages.kio-fuse

    (pkgs.callPackage custom.geode-cli {})
  ];
}
