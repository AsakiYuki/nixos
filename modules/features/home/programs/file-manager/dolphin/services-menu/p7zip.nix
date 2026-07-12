{
  lib,
  pkgs,
  ...
}: {
  services-menu.p7zip-menu = {
    "Desktop Entry" = {
      Type = "Service";
      MimeType = "application/zip;application/x-7z-compressed;application/vnd.rar;";
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

  services-menu.tar-menu = {
    "Desktop Entry" = {
      Type = "Service";
      MimeType = "application/x-tar;application/x-compressed-tar;application/x-gzip;application/x-bzip2;application/x-xz;application/x-tarz;";
      Actions = "ExtractHere;ExtractToFolder;";
      "X-KDE-Submenu" = "Tar Tools";
      "X-KDE-Priority" = "TopLevel";
    };

    "Desktop Action ExtractHere" = {
      Name = "Extract here";
      Icon = "xarchiver";
      Exec = "${pkgs.bash}/bin/bash -c 'cd \"$(dirname \"%f\")\" && ${pkgs.gnutar}/bin/tar -xf \"$(basename \"%f\")\"'";
    };

    "Desktop Action ExtractToFolder" = {
      Name = "Extract to folder";
      Icon = "xarchiver";
      Exec = "${pkgs.bash}/bin/bash -c 'FILE=\"$(basename \"%f\")\"; DIRNAME=\"\${FILE%%.tar*}\"; DIRNAME=\"\${DIRNAME%.*}\"; cd \"$(dirname \"%f\")\" && mkdir -p \"\$DIRNAME\" && ${pkgs.gnutar}/bin/tar -xf \"\$FILE\" -C \"\$DIRNAME\"'";
    };
  };

  services-menu.p7zip-compress = let
    compressTypes = ["zip" "7z" "tar.gz" "tar.xz"];
  in
    lib.mergeAttrs {
      "Desktop Entry" = {
        Type = "Service";
        MimeType = "inode/directory;";
        Actions = lib.strings.concatMapStrings (type: "compressto${lib.strings.sanitizeDerivationName type};") compressTypes;
        "X-KDE-Submenu" = "Archive Manager";
        "X-KDE-Priority" = "TopLevel";
      };
    }
    (
      builtins.listToAttrs
      (
        map (type: let
          actionName = "Desktop Action compressto${lib.strings.sanitizeDerivationName type}";
          execCmd =
            if type == "tar.gz"
            then "${pkgs.bash}/bin/bash -c 'cd \"$(dirname \"%f\")\" && ${pkgs.gnutar}/bin/tar -czf \"$(basename \"%f\").tar.gz\" \"$(basename \"%f\")\"'"
            else if type == "tar.xz"
            then "${pkgs.bash}/bin/bash -c 'cd \"$(dirname \"%f\")\" && ${pkgs.gnutar}/bin/tar -cJf \"$(basename \"%f\").tar.xz\" \"$(basename \"%f\")\"'"
            else "${pkgs.bash}/bin/bash -c 'cd \"$(dirname \"%f\")\" && ${pkgs.p7zip-rar}/bin/7z a \"$(basename \"%f\").${type}\" \"$(basename \"%f\")\"'";
        in {
          name = actionName;
          value = {
            Name = "Compress to ${type}";
            Icon = "xarchiver";
            Exec = execCmd;
          };
        })
        compressTypes
      )
    );
}
