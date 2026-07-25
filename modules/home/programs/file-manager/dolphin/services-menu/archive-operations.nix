{pkgs, ...}: let
  sevenZip = "${pkgs.p7zip-rar}/bin/7z";
  tar = "${pkgs.gnutar}/bin/tar";
  zip = "${pkgs.zip}/bin/zip";
  rar = "${pkgs.rar}/bin/rar";
  unrar = "${pkgs.unrar}/bin/unrar";
  gzip = "${pkgs.gzip}/bin/gzip";
  bzip2 = "${pkgs.bzip2}/bin/bzip2";
  unace = "${pkgs.unace}/bin/unace";
  kdialog = "${pkgs.kdePackages.kdialog}/bin/kdialog";

  compressScript = pkgs.writeShellScript "dolphin-compress-action" ''
    set -euo pipefail

    type="$1"
    shift

    first_file="$1"
    dir=$(dirname "$first_file")
    cd "$dir"

    files=()
    for f in "$@"; do
      files+=("$(basename "$f")")
    done

    if [ "$
      name=$(${kdialog} --title "Name of archive" --inputbox "Please enter a name for this archive:" "archive" || true)
      if [ -z "$name" ]; then
        ${kdialog} --title "Compress" --error "Compression aborted!"
        exit 0
      fi
    else
      name=$(basename "$first_file")
    fi

    case "$type" in
      rar)      ext="rar";     cmd=(${rar} a -o+) ;;
      tar)      ext="tar";     cmd=(${tar} -cf) ;;
      tar.gz)   ext="tar.gz";  cmd=(${tar} -czf) ;;
      tgz)      ext="tgz";     cmd=(${tar} -czf) ;;
      zip)      ext="zip";     cmd=(${zip} -r) ;;
      7z)       ext="7z";      cmd=(${sevenZip} a -aoa) ;;
      tar.7z)   ext="tar.7z";  cmd=() ;;
      tar.bz2)  ext="tar.bz2"; cmd=(${tar} -cf - --bzip2) ;;
      gz)       ext="gz";      cmd=(${gzip} -r -f) ;;
      bz2)      ext="bz2";     cmd=(${bzip2} -z -f) ;;
      *)        echo "Unsupported type: $type"; exit 1 ;;
    esac

    archname="''${name}.''${ext}"

    if [ -e "$archname" ]; then
      if ! ${kdialog} --warningyesno "This folder already includes an archive with the same name ($archname). Do you want to overwrite it?"; then
        ${kdialog} --title "Compress" --error "Compression aborted!"
        exit 0
      fi
    fi

    if [ "$type" = "tar.7z" ]; then
      tmp_tar="''${name}.tmp.tar"
      ${tar} -cf "$tmp_tar" "''${files[@]}" --overwrite
      ${sevenZip} a -aoa "$archname" "$tmp_tar"
      rm -f "$tmp_tar"
    elif [ "$type" = "gz" ] || [ "$type" = "bz2" ]; then
      if [ "$

        archname="''${name}.tar.''${ext}"
        if [ "$type" = "gz" ]; then
          ${tar} -czf "$archname" "''${files[@]}" --overwrite
        else
          ${tar} -cf "$archname" --bzip2 "''${files[@]}" --overwrite
        fi
      else
        "''${cmd[@]}" "''${files[@]}"
      fi
    else
      "''${cmd[@]}" "$archname" "''${files[@]}"
    fi

    ${kdialog} --title "Compress" --msgbox "Compression done!"
  '';

  extractScript = pkgs.writeShellScript "dolphin-extract-action" ''
    set -euo pipefail

    mode="$1"
    tool="$2"
    archive="$3"

    require_pw="''${4:-false}"

    d=$(dirname "$archive")
    b=$(basename "$archive")

    case "$b" in
      *.tar.gz|*.tar.bz2|*.tar.xz) n="''${b%.*.*}" ;;
      *) n="''${b%.*}" ;;
    esac

    target_dir="$d"
    if [ "$mode" = "subfolder" ]; then
      target_dir="$d/$n"
    elif [ "$mode" = "to" ]; then
      dest=$(${kdialog} --title "Select Target Directory" --getexistingdirectory ~/ || true)
      if [ -z "$dest" ]; then
        ${kdialog} --title "Extract" --error "Extraction aborted!"
        exit 0
      fi
      target_dir="$dest/$n"
    fi

    password=""
    if [ "$require_pw" = "true" ]; then
      password=$(${kdialog} --password "Please enter the password." || true)
    fi

    if [ -e "$target_dir" ] && [ "$mode" != "here" ]; then
      if ! ${kdialog} --warningyesno "Destination '$target_dir' already exists. Do you want to overwrite contents?"; then
        ${kdialog} --title "Extract" --error "Extraction aborted!"
        exit 0
      fi
    fi

    cd "$d"


    case "$tool" in
      7z)
        opts=(-aoa -y)
        [ -n "$password" ] && opts+=("-p$password")
        if [ "$mode" = "here" ]; then
          ${sevenZip} x "''${opts[@]}" "$b"
        else
          mkdir -p "$target_dir"
          ${sevenZip} x "''${opts[@]}" "$b" -o"$target_dir"
        fi
        ;;
      rar)
        opts=(-o+)
        [ -n "$password" ] && opts+=("-p$password")
        mkdir -p "$target_dir"
        ${unrar} x "''${opts[@]}" "$b" "$target_dir"
        ;;
      tar)
        mkdir -p "$target_dir"
        ${tar} -xf "$b" -C "$target_dir" --overwrite
        ;;
      gz)
        mkdir -p "$target_dir"
        cp "$b" "$target_dir/"
        (cd "$target_dir" && ${gzip} -d -r -f "$b")
        ;;
      bz2)
        mkdir -p "$target_dir"
        cp "$b" "$target_dir/"
        (cd "$target_dir" && ${bzip2} -d -f "$b")
        ;;
      ace)
        mkdir -p "$target_dir"
        cp "$b" "$target_dir/"
        opts=(-o -y)
        [ -n "$password" ] && opts+=("-p$password")
        (cd "$target_dir" && ${unace} x "''${opts[@]}" "$b" && rm -f "$b")
        ;;
    esac

    ${kdialog} --title "Extract" --msgbox "Extraction done!"
  '';
in {
  services-menu = {
    intika-compress = {
      "Desktop Entry" = {
        Type = "Service";
        MimeType = "inode/directory;all/allfiles;";
        Actions = "compress_7ZIP;compress_RAR;compress_TAR;compress_TAR7ZIP;compress_TARBZIP;compress_TARGZ;compress_TGZ;compress_ZIP;compress_GZIP;compress_BZIP;";
        "X-KDE-Submenu" = "Compress (Intika)";
        "X-KDE-Priority" = "TopLevel";
      };

      "Desktop Action compress_7ZIP" = {
        Name = "Compress to 7z";
        Icon = "application-x-archive";
        Exec = "${compressScript} 7z %U";
      };
      "Desktop Action compress_RAR" = {
        Name = "Compress to rar";
        Icon = "application-x-archive";
        Exec = "${compressScript} rar %U";
      };
      "Desktop Action compress_TAR" = {
        Name = "Compress to tar";
        Icon = "application-x-archive";
        Exec = "${compressScript} tar %U";
      };
      "Desktop Action compress_TAR7ZIP" = {
        Name = "Compress to tar.7z";
        Icon = "application-x-archive";
        Exec = "${compressScript} tar.7z %U";
      };
      "Desktop Action compress_TARBZIP" = {
        Name = "Compress to tar.bz2";
        Icon = "application-x-archive";
        Exec = "${compressScript} tar.bz2 %U";
      };
      "Desktop Action compress_TARGZ" = {
        Name = "Compress to tar.gz";
        Icon = "application-x-archive";
        Exec = "${compressScript} tar.gz %U";
      };
      "Desktop Action compress_TGZ" = {
        Name = "Compress to tgz";
        Icon = "application-x-archive";
        Exec = "${compressScript} tgz %U";
      };
      "Desktop Action compress_ZIP" = {
        Name = "Compress to zip";
        Icon = "application-x-archive";
        Exec = "${compressScript} zip %U";
      };
      "Desktop Action compress_GZIP" = {
        Name = "Compress to gz";
        Icon = "application-x-archive";
        Exec = "${compressScript} gz %U";
      };
      "Desktop Action compress_BZIP" = {
        Name = "Compress to bz2";
        Icon = "application-x-archive";
        Exec = "${compressScript} bz2 %U";
      };
    };

    intika-extract = {
      "Desktop Entry" = {
        Type = "Service";
        MimeType = "application/x-7z-compressed;application/x-rar;application/zip;application/x-tar;application/x-compressed-tar;application/x-bzip-compressed-tar;application/x-gzip;application/x-bzip;application/x-ace;";
        Actions = "extract_here;extract_to_folder;extract_to;extract_pw_here;extract_pw_to_folder;extract_pw_to;";
        "X-KDE-Submenu" = "Extract (Intika)";
        "X-KDE-Priority" = "TopLevel";
      };

      "Desktop Action extract_here" = {
        Name = "Extract here";
        Icon = "application-x-archive";
        Exec = "${extractScript} here 7z %f false";
      };
      "Desktop Action extract_to_folder" = {
        Name = "Extract to subfolder";
        Icon = "application-x-archive";
        Exec = "${extractScript} subfolder 7z %f false";
      };
      "Desktop Action extract_to" = {
        Name = "Extract to...";
        Icon = "application-x-archive";
        Exec = "${extractScript} to 7z %f false";
      };
      "Desktop Action extract_pw_here" = {
        Name = "Extract here (Enter password)";
        Icon = "application-x-archive";
        Exec = "${extractScript} here 7z %f true";
      };
      "Desktop Action extract_pw_to_folder" = {
        Name = "Extract to subfolder (Enter password)";
        Icon = "application-x-archive";
        Exec = "${extractScript} subfolder 7z %f true";
      };
      "Desktop Action extract_pw_to" = {
        Name = "Extract to... (Enter password)";
        Icon = "application-x-archive";
        Exec = "${extractScript} to 7z %f true";
      };
    };
  };
}
