{
  lib,
  pkgs,
  ...
}: let
  sevenZip = "${pkgs.p7zip-rar}/bin/7z";
  tar = "${pkgs.gnutar}/bin/tar";

  tarPath = "${pkgs.bzip2}/bin:${pkgs.xz}/bin";
  sanitizeName = type: lib.replaceStrings ["."] [""] type;
  compressTypes = ["zip" "7z" "tar.gz" "tar.xz" "tar.bz2"];

  tarFlags = {
    "tar.gz" = "-czf";
    "tar.xz" = "-cJf";
    "tar.bz2" = "-cjf";
  };

  isTar = type: builtins.hasAttr type tarFlags;

  combinedExec = type:
    if isTar type
    then ''sh -c 'if [ "$#" -eq 1 ]; then out=$(basename "$1"); else out=$(basename "$(dirname "$1")"); fi; d=$(dirname "$1"); (cd "$d" && PATH="${tarPath}:$PATH" ${tar} ${tarFlags.${type}} "$out.${type}" "$@")' -- %F''
    else ''sh -c 'if [ "$#" -eq 1 ]; then out=$(basename "$1"); else out=$(basename "$(dirname "$1")"); fi; d=$(dirname "$1"); (cd "$d" && ${sevenZip} a -y "$out.${type}" "$@")' -- %F'';

  eachExec = type:
    if isTar type
    then ''sh -c 'for f in "$@"; do d=$(dirname "$f"); b=$(basename "$f"); (cd "$d" && PATH="${tarPath}:$PATH" ${tar} ${tarFlags.${type}} "$b.${type}" "$b"); done' -- %F''
    else ''sh -c 'for f in "$@"; do d=$(dirname "$f"); b=$(basename "$f"); (cd "$d" && ${sevenZip} a -y "$b.${type}" "$b"); done' -- %F'';

  combinedActions = builtins.listToAttrs (map (type: {
      name = "Desktop Action compressto${sanitizeName type}";
      value = {
        Name = "Compress to ${type}";
        Icon = "xarchiver";
        Exec = combinedExec type;
      };
    })
    compressTypes);

  eachActions = builtins.listToAttrs (map (type: {
      name = "Desktop Action compressto${sanitizeName type}Each";
      value = {
        Name = "Compress each to ${type}";
        Icon = "xarchiver";
        Exec = eachExec type;
      };
    })
    compressTypes);

  combinedActionNames = map (type: "compressto${sanitizeName type}") compressTypes;
  eachActionNames = map (type: "compressto${sanitizeName type}Each") compressTypes;

  extractHereScript = pkgs.writeShellScript "p7zip-extract-here" ''
    set -euo pipefail
    fix() {
      local base="$1"
      while IFS= read -r x; do
        rel="''${x//\\//}"
        mkdir -p "$(dirname "$rel")"
        mv "$x" "$rel"
      done < <(find "$base" -depth -name '*\\*')
    }
    for f in "$@"; do
      d=$(dirname "$f")
      b=$(basename "$f")
      case "$b" in
        *.tar.gz|*.tar.bz2|*.tar.xz) n="''${b%.*.*}" ;;
        *) n="''${b%.*}" ;;
      esac
      cd "$d"
      top=$(${sevenZip} l -ba -slt "$b" | awk -F' = ' '/^Path/{print $2}' | grep -v "^$b\$" | tr '\\' '/' | cut -d/ -f1 | sort -u)
      count=$(printf '%s\n' "$top" | grep -c .)
      if [ "$count" -eq 1 ]; then
        ${sevenZip} x -y "$b"
        fix "$d"
      else
        mkdir -p "$n"
        ${sevenZip} x -y "$b" -o"$n"
        fix "$n"
      fi
      cd - >/dev/null
    done
  '';

  extractToFolderScript = pkgs.writeShellScript "p7zip-extract-to-folder" ''
    set -euo pipefail
    fix() {
      local base="$1"
      while IFS= read -r x; do
        rel="''${x//\\//}"
        mkdir -p "$(dirname "$rel")"
        mv "$x" "$rel"
      done < <(find "$base" -depth -name '*\\*')
    }
    for f in "$@"; do
      d=$(dirname "$f")
      b=$(basename "$f")
      case "$b" in
        *.tar.gz|*.tar.bz2|*.tar.xz) n="''${b%.*.*}" ;;
        *) n="''${b%.*}" ;;
      esac
      cd "$d"
      mkdir -p "$n"
      ${sevenZip} x -y "$b" -o"$n"
      fix "$n"
      cd - >/dev/null
    done
  '';
in {
  services-menu = {
    p7zip-extract = {
      "Desktop Entry" = {
        Type = "Service";
        MimeType = "application/zip;application/x-7z-compressed;application/vnd.rar;application/x-tar;application/x-compressed-tar;application/x-gzip;application/x-bzip2;application/x-xz;application/x-tarz;";
        Actions = "ExtractHere;ExtractToFolder;TestArchive;";
        "X-KDE-Submenu" = "7zip extract";
        "X-KDE-Priority" = "TopLevel";
      };

      "Desktop Action ExtractHere" = {
        Name = "Extract here";
        Icon = "xarchiver";
        Exec = "${extractHereScript} %F";
      };

      "Desktop Action ExtractToFolder" = {
        Name = "Extract to folder";
        Icon = "xarchiver";
        Exec = "${extractToFolderScript} %F";
      };

      "Desktop Action TestArchive" = {
        Name = "Test archive";
        Icon = "xarchiver";
        Exec = ''sh -c 'for f in "$@"; do ${sevenZip} t "$f"; done' -- %F'';
      };
    };

    p7zip-compress =
      {
        "Desktop Entry" = {
          Type = "Service";
          MimeType = "inode/directory;all/allfiles;";
          Actions = lib.strings.concatMapStrings (name: "${name};") combinedActionNames;
          "X-KDE-Submenu" = "7zip compress";
          "X-KDE-Priority" = "TopLevel";
        };
      }
      // combinedActions;

    p7zip-compress-each =
      {
        "Desktop Entry" = {
          Type = "Service";
          MimeType = "inode/directory;all/allfiles;";
          Actions = lib.strings.concatMapStrings (name: "${name};") eachActionNames;
          "X-KDE-Submenu" = "7zip compress each";
          "X-KDE-Priority" = "TopLevel";
        };
      }
      // eachActions;
  };
}
