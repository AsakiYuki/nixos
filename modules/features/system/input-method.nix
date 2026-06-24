{pkgs, ...}: {
  i18n.inputMethod = {
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      # fcitx5-bamboo
      kdePackages.fcitx5-unikey
    ];
  };
}
