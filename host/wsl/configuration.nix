{pkgs, libs, ...}: {
  imports = [
    (libs.root "/users/asakiyuki/configuration.nix")
  ];

  wsl.enable = true;
  wsl.defaultUser = "asakiyuki";
  
  environment.systemPackages = with pkgs; [
    git
  ];

  home-manager.users.asakiyuki.programs = {
    bash.enable = true;
    fastfetch.enable = true;
    starship.enable = true;
  };
}