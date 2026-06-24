{pkgs, ...}: {
  environment = {
    etc = {
      "usr/share/hypr".source = pkgs.hyprland.outPath + "/share/hypr/";
    };

    variables = {
      QML_IMPORT_PATH = "/run/current-system/sw/lib/qt-6/qml";
      QML2_IMPORT_PATH = "/etc/profiles/per-user/asakiyuki/lib/qt-6/qml";
    };
  };
}
