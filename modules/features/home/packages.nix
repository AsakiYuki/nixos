{
  lib,
  config,
  osconfig,
  ...
}: {
  home.packages =
    [
      (lib.mkIf config.programs.catppuccin.enable config.programs.catppuccin.package)

      (lib.mkIf config.programs.antigravity.enable config.programs.antigravity.package)
      (lib.mkIf config.programs.idea.enable config.programs.idea.package)
      (lib.mkIf config.programs.datagrip.enable config.programs.datagrip.package)
      (lib.mkIf config.programs.zen-browser.enable config.programs.zen-browser.package)
      (lib.mkIf config.programs.mangohud.enable config.programs.mangohud.package)
      (lib.mkIf config.programs.telegram.enable config.programs.telegram.package)
      (lib.mkIf config.programs.prismlauncher.enable config.programs.prismlauncher.package)
      (lib.mkIf config.programs.vlc.enable config.programs.vlc.package)
      (lib.mkIf config.programs.gimp.enable config.programs.gimp.package)
      (lib.mkIf config.programs.libreoffice.enable config.programs.libreoffice.package)
      (lib.mkIf config.programs.osu.enable config.programs.osu.package)
      (lib.mkIf config.programs.lmstudio.enable config.programs.lmstudio.package)
      (lib.mkIf config.programs.blender.enable config.programs.blender.package)
      (lib.mkIf config.programs.xprop.enable config.programs.xprop.package)
      (lib.mkIf config.programs.davinci-resolve.enable config.programs.davinci-resolve.package)
      (lib.mkIf config.programs.wl-clipboard.enable config.programs.wl-clipboard.package)

      (lib.mkIf config.programs.pavucontrol.enable config.programs.pavucontrol.package)
      (lib.mkIf config.programs.nwg-look.enable config.programs.nwg-look.package)

      (lib.mkIf config.programs.hytale.enable config.programs.hytale.package)
      (lib.mkIf (
          config.programs.cider.enable && osconfig.device.programs.cider-2.enable
        )
        config.programs.cider.package)
    ]
    ++ (lib.optionals config.programs.proton-ge.enable config.programs.proton-ge.packages)
    ++ (lib.optionals config.programs.proton-apps.enable config.programs.proton-apps.packages);
}
