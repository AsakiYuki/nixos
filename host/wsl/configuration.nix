{pkgs, ...}: {
  wsl.enable = true;
  wsl.defaultUser = "nixos";
  
  environment.systemPackages = with pkgs; [
    git
  ];
}