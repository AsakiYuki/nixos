{
  libs,
  lib,
  config,
  ...
}: {
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

      open-here = {
        "Desktop Entry" = {
          Type = "Service";
          ServiceTypes = "KonqPopupMenu/Plugin";
          MimeType = "inode/directory";
          Actions = "RunCodeDir;RunGhosttyDir;RunNvimDir;RunAntigravityDir;";
        };

        "Desktop Action RunCodeDir" = {
          Name = "Open with Code";
          Icon = "vscode";
          Exec = "code \"%F\"";
        };

        "Desktop Action RunGhosttyDir" = {
          Name = "Open Ghostty here";
          Icon = "com.mitchellh.ghostty";
          Exec = "ghostty +new-window --working-directory=\"%F\"";
        };

        "Desktop Action RunNvimDir" = {
          Name = "Open with Nvim";
          Icon = "nvim";
          Exec = "ghostty +new-window --working-directory=\"~/.config\" -e nvim .";
        };

        "Desktop Action RunAntigravityDir" = {
          Name = "Open with Antigravity";
          Icon = "antigravity";
          Exec = "antigravity \"%F\"";
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

  config.programs.kde.kdeglobals.config.PreviewSettings = lib.optionalAttrs config.programs.dolphin.enable {
    EnableRemoteFolderThumbnail = true;
    MaximumRemoteSize = 4194304;
    MaximumSize = 4194304;
  };
}
