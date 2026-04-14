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

      open-ghostty-here = {
        "Desktop Entry" = {
          Type = "Service";
          ServiceTypes = "KonqPopupMenu/Plugin";
          MimeType = "inode/directory";
          Actions = "RunGhosttyDir";
        };
        "Desktop Action RunGhosttyDir" = {
          Name = "Open Ghostty here";
          Icon = "com.mitchellh.ghostty";
          Exec = "ghostty +new-window --working-directory=\"%F\"";
        };
      };

      open-with-antigravity = {
        "Desktop Entry" = {
          Type = "Service";
          ServiceTypes = "KonqPopupMenu/Plugin";
          MimeType = "inode/directory";
          Actions = "RunCodeDir";
        };

        "Desktop Action RunCodeDir" = {
          Name = "Open with Antigravity";
          Icon = "antigravity";
          Exec = "antigravity \"%F\"";
        };
      };

      open-with-code = {
        "Desktop Entry" = {
          Type = "Service";
          ServiceTypes = "KonqPopupMenu/Plugin";
          MimeType = "inode/directory";
          Actions = "RunCodeDir";
        };

        "Desktop Action RunCodeDir" = {
          Name = "Open with Code";
          Icon = "vscode";
          Exec = "vscode \"%F\"";
        };
      };

      open-with-nvim = {
        "Desktop Entry" = {
          Type = "Service";
          ServiceTypes = "KonqPopupMenu/Plugin";
          MimeType = "inode/directory";
          Actions = "RunCodeDir";
        };

        "Desktop Action RunCodeDir" = {
          Name = "Open with Nvim";
          Icon = "nvim";
          Exec = "ghostty +new-window --working-directory=\"~/.config\" -e nvim .";
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
