{ pkgs, ... }:
{
  type = "fcitx5";
  enable = true;
  fcitx5 = {
    addons = with pkgs; [
      fcitx5-bamboo
    ];
  };
}
