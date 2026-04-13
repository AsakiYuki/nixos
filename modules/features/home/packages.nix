{
  pkgs,
  lib,
  config,
  osconfig,
  inputs,
  ...
}:
{
  home.packages = [
    (lib.mkIf config.programs.catppuccin.enable config.programs.catppuccin.package)

    (lib.mkIf config.programs.packages.antigravity.enable config.programs.packages.antigravity.package)
    (lib.mkIf config.programs.packages.prismlauncher.enable config.programs.packages.prismlauncher.package)
    (lib.optionals config.programs.proton-ge.enable config.programs.proton-ge.packages)
    (lib.mkIf config.programs.packages.vlc.enable config.programs.packages.vlc.package)
    (lib.mkIf config.programs.packages.gimp.enable config.programs.packages.gimp.package)
    (lib.mkIf config.programs.packages.libreoffice.enable config.programs.packages.libreoffice.package)
    (lib.mkIf config.programs.packages.osu.enable config.programs.packages.osu.package)
    (lib.mkIf config.programs.packages.lmstudio.enable config.programs.packages.lmstudio.package)
    (lib.mkIf config.programs.packages.blender.enable config.programs.packages.blender.package)
    (lib.mkIf config.programs.packages.xprop.enable config.programs.packages.xprop.package)

    (lib.mkIf config.programs.packages.pavucontrol.enable config.programs.packages.pavucontrol.package)
    (lib.mkIf config.programs.packages.nwg-look.enable config.programs.packages.nwg-look.package)

    (lib.optionals config.programs.proton-apps.enable config.programs.proton-apps.packages)

    (lib.mkIf config.programs.packages.hytale.enable config.programs.packages.hytale.package)
    (lib.mkIf (
      config.programs.packages.cider.enable && osconfig.device.programs.cider-2.enable
    ) config.programs.packages.cider.package)
  ];
}
