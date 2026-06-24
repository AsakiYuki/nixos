{
  # inputs,
  # pkgs,
  # libs,
  lib, config, 
  ...
}: {
  boot.loader = lib.mkIf (!(lib.attrByPath ["wsl" "enable"] false config)) {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    systemd-boot = {
      enable = true;
      editor = false;
    };
    grub.enable = false;
  };
}
# let
#   background = libs.root "/assets/grub/background.png";
#   baseTheme = inputs.honkai-railway-grub-theme.packages.${pkgs.stdenv.hostPlatform.system}.cyrene-grub-theme;
# in {
#   boot = {
#     loader = {
#       efi.canTouchEfiVariables = true;
#       grub = {
#         enable = true;
#         device = "nodev";
#         efiSupport = true;
#         useOSProber = true;
#         splashImage = background;
#         theme = pkgs.runCommand "my-grub-theme" {} ''
#           mkdir -p $out
#           cp -r ${baseTheme}/* $out/
#           chmod -R u+w $out
#           cp ${background} $out/background.png
#         '';
#       };
#     };
#   };
# }

