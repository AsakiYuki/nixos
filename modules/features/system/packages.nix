{
  pkgs,
  lib,
  config,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
      git
      vim
      btop
      wget
      tree

      nixd
      nixfmt

      zip
      unzip

      (lib.mkIf config.programs.ffmpeg.enable config.programs.ffmpeg.package)
      (lib.mkIf config.programs.nodejs.enable config.programs.nodejs.package)
      (lib.mkIf config.programs.bun.enable config.programs.bun.package)
      (lib.mkIf config.programs.brightnessctl.enable config.programs.brightnessctl.package)
      (lib.mkIf config.programs.php.enable config.programs.php.package)
      (lib.mkIf config.programs.ntfs3g.enable config.programs.ntfs3g.package)
      (lib.mkIf config.programs.python.enable config.programs.python.package)
      (lib.mkIf config.programs.jdk.enable config.programs.jdk.package)

      (lib.mkIf config.programs.quickshell.enable config.programs.quickshell.package)
      (lib.mkIf config.programs.papirus-icons.enable config.programs.papirus-icons.package)
    ]
    ++ (lib.optionals config.programs.gcc.enable config.programs.gcc.packages)
    ++ (lib.optionals config.programs.winepackages.enable config.programs.winepackages.packages)
    ++ (lib.optionals config.programs.kde-packages.enable config.programs.kde-packages.packages)
    ++ (lib.optionals config.programs.r-tensorflow.enable [ config.programs.r-tensorflow.package ])
    ++ (lib.optionals (
      config.programs.hyprland-portals.enable && config.device.wm.hyprland.enable
    ) config.programs.hyprland-portals.packages);
}
