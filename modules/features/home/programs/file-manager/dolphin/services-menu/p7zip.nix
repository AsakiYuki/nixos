{
  lib,
  pkgs,
  ...
}: {
  services-menu.p7zip-extract = {
    "Desktop Entry" = {
      Type = "Service";
      MimeType = "application/zip;application/x-7z-compressed;application/vnd.rar;application/x-tar;application/x-compressed-tar;";
      Actions = "ExtractHere;ExtractToFolder;";
      "X-KDE-Submenu" = "7zip";
      "X-KDE-Priority" = "TopLevel";
    };

    "Desktop Action ExtractHere" = {
      Name = "Extract here";
      Icon = "xarchiver";
      Exec = "${pkgs.p7zip-rar}/bin/7z x \"%f\"";
    };

    "Desktop Action ExtractToFolder" = {
      Name = "Extract to folder";
      Icon = "xarchiver";
      Exec = "${pkgs.p7zip-rar}/bin/7z x \"%f\" -o*";
    };
  };

  services-menu.p7zip-compress = let
    compressTypes = ["zip" "7z"];
  in
    lib.mergeAttrs {
      "Desktop Entry" = {
        Type = "Service";
        MimeType = "inode/directory;";
        Actions = lib.strings.join ";" (map (type: "compressto${type}") compressTypes);
        "X-KDE-Submenu" = "7zip";
        "X-KDE-Priority" = "TopLevel";
      };
    }
    (
      builtins.listToAttrs
      (
        map (type: {
          name = "Desktop Action compressto${type}";
          value = {
            Name = "Compress to ${type}";
            Icon = "xarchiver";
            Exec = "${pkgs.p7zip-rar}/bin/7z a \"%f.${type}\" \"%f\"";
          };
        })
        compressTypes
      )
    );
}
