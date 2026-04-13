{
  pkgs,
  lib,
  config,
  ...
}: let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = config.device.dm.sddm.theme;
  };
in {
  services.displayManager.sddm = lib.mkIf config.device.dm.sddm.enable {
    enable = true;
    wayland.enable = true;
    extraPackages = [
      custom-sddm-astronaut
    ];
    theme = "sddm-astronaut-theme";
    settings = {
      Theme = {
        Current = "sddm-astronaut-theme";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
    kdePackages.qtmultimedia
  ];
}
