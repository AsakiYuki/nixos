{...}: {
  users.users.asakiyuki = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  home-manager.users.asakiyuki = {
    imports = [
      ./programs.nix
      ../../modules/features/home/theme.nix
    ];
  };
}
