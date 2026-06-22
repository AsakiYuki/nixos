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

      open-here = lib.mergeAttrsList (let 
        cfg = config.programs;
      in  [
        {
          "Desktop Entry" = {
            Type = "Service";
            ServiceTypes = "KonqPopupMenu/Plugin";
            MimeType = "inode/directory";
            Actions = (lib.join ";" [
              (lib.optionalString cfg.vscode.enable "RunCodeDir")
              (lib.optionalString cfg.ghostty.enable "RunGhosttyDir")
              (lib.optionalString cfg.nixvim.enable "RunNvimDir")
              (lib.optionalString cfg.antigravity.enable "RunAntigravityDir")
            ]);
          };
        }

        (lib.optionalAttrs cfg.vscode.enable {
          "Desktop Action RunCodeDir" = {
            Name = "Open with Code";
            Icon = "vscode";
            Exec = "code \"%F\"";
          };
        })

        (lib.optionalAttrs cfg.ghostty.enable {
          "Desktop Action RunGhosttyDir" = {
            Name = "Open Ghostty here";
            Icon = "com.mitchellh.ghostty";
            Exec = "ghostty +new-window --working-directory=\"%F\"";
          };
        })

        (lib.optionalAttrs cfg.nixvim.enable {
          "Desktop Action RunNvimDir" = {
            Name = "Open with Nvim";
            Icon = "nvim";
            Exec = "ghostty +new-window --working-directory=\"~/.config\" -e nvim .";
          };
        })

        (lib.optionalAttrs cfg.antigravity.enable {
          "Desktop Action RunAntigravityDir" = {
            Name = "Open with Antigravity";
            Icon = "antigravity";
            Exec = "antigravity \"%F\"";
          };
        })
      ]);
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

  programs.kde.kdeglobals = {
    enable = true;
    config.PreviewSettings = lib.optionalAttrs config.programs.dolphin.enable {
      EnableRemoteFolderThumbnail = true;
      MaximumRemoteSize = 1024 * 1024 * 1024 * 5;
      MaximumSize = 1024 * 1024 * 1024 * 5;
    };
  };
}
