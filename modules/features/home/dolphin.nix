{libs, ...}: {
  programs.dolphin = {
    services-menu = {
      copy-server-public-url = {
        "Desktop Entry" = {
          Type = "Service";
          ServiceTypes = "KonqPopupMenu/Plugin";
          MimeType = "all/allfiles";
          Actions = "CopyPublicURL";
        };
        "Desktop Action CopyPublicURL" = {
          Name = "Copy location as URL";
          Icon = "org.kde.plasma.clipboard";
          Exec = "${libs.root "/scripts/copy-public-url.sh"} \"%F\"";
        };
      };
    };
    configs = {
      General = {
        RememberOpenedTabs = false;
        ModifiedStartupSettings = true;
        FilterBar = true;
      };
      ContextMenu = {
        ShowOpenTerminal = false;
      };
    };
  };
}
