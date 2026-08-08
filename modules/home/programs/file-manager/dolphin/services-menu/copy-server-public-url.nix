{lib, ...}: {
  services-menu.copy-server-public-url = {
    "Desktop Entry" = {
      Type = "Service";
      ServiceTypes = "KonqPopupMenu/Plugin";
      MimeType = "all/allfiles";
      Actions = "CopyPublicURL";
    };
    "Desktop Action CopyPublicURL" = {
      Name = "Copy location as URL";
      Icon = "org.kde.plasma.clipboard";
      Exec = "${lib.root "/scripts/shell/copy-public-url.sh"} \"%F\"";
    };
  };
}
