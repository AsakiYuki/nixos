{inputs, ...}: {
  imports = [inputs.fcitx5-lotus.nixosModules.fcitx5-lotus];

  services.fcitx5-lotus = {
    enable = true;
    users = ["asakiyuki"];
  };
}
