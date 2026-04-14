{
  lib,
  pkgs,
  config,
  ...
}: let
  sanitize = lib.mapAttrsRecursive (
    path: value:
      if lib.isList value
      then lib.concatStringsSep "," value
      else value
  );
in {
  config = lib.mkIf config.programs.dolphin.enable {
    home.packages = [
      config.programs.dolphin.package
    ];

    home.file.".config/dolphinrc" = {
      text = lib.generators.toINI {} (sanitize config.programs.dolphin.configs);
      force = true;
    };
  };

  options.programs.dolphin = {
    enable = lib.mkEnableOption "dolphin";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.kdePackages.dolphin;
    };

    configs = {
      General = {
        DoubleClickViewAction = lib.mkOption {
          type = lib.types.str;
          default = "edit_select_all";
        };
        DoubleClickViewCustomAction = lib.mkOption {
          type = lib.types.str;
          default = "";
        };
        EditableUrl = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        UrlCompletionMode = lib.mkOption {
          type = lib.types.int;
          default = 1;
        };
        ShowFullPath = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        ShowFullPathInTitlebar = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        OpenExternallyCalledFolderInNewTab = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        AlwaysShowTabBar = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        ShowCloseButtonOnTabs = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        TabStyle = lib.mkOption {
          type = lib.types.enum ["AutoSize" "FullWidth" "FixedSize"];
          default = "AutoSize";
        };
        Version = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
        HomeUrl = lib.mkOption {
          type = lib.types.str;
          default = config.home.homeDirectory;
        };
        RememberOpenedTabs = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        SplitView = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        FilterBar = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        GlobalViewProps = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        BrowseThroughArchives = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        ConfirmClosingMultipleTabs = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ConfirmClosingTerminalRunningProgram = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        RenameInline = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowSelectionToggle = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowPasteBarAfterCopying = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        UseTabForSwitchingSplitView = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        CloseSplitViewChoice = lib.mkOption {
          type = lib.types.enum ["ActiveView" "InactiveView" "RightView"];
          default = "ActiveView";
        };
        OpenNewTabAfterLastTab = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        ShowToolTips = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        AutoExpandFolders = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        ShowStatusBar = lib.mkOption {
          type = lib.types.enum ["Small" "FullWidth" "Disabled"];
          default = "Small";
        };
        ShowZoomSlider = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        LockPanels = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        EnlargeSmallPreviews = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        SortingChoice = lib.mkOption {
          type = lib.types.enum ["NaturalSorting" "CaseInsensitiveSorting" "CaseSensitiveSorting"];
          default = "NaturalSorting";
        };
        HideXTrashFile = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        DynamicView = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        ModifiedStartupSettings = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
      };

      CompactMode = {
        UseSystemFont = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ViewFont = lib.mkOption {
          type = lib.types.str;
          default = "System Font";
        };
        IconSize = lib.mkOption {
          type = lib.types.int;
          default = 22;
        };
        PreviewSize = lib.mkOption {
          type = lib.types.int;
          default = 48;
        };
        MaximumTextWidthIndex = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
      };

      ContentDisplay = {
        DirectorySizeMode = lib.mkOption {
          type = lib.types.enum ["ContentCount" "ContentSize" "None"];
          default = "ContentCount";
        };
        RecursiveDirectorySizeLimit = lib.mkOption {
          type = lib.types.int;
          default = 10;
        };
        UseShortRelativeDates = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        UsePermissionsFormat = lib.mkOption {
          type = lib.types.enum ["SymbolicFormat" "NumericFormat" "CombinedFormat"];
          default = "SymbolicFormat";
        };
        ElidingMode = lib.mkOption {
          type = lib.types.enum ["Right" "Middle"];
          default = "Middle";
        };
      };

      ContextMenu = {
        ShowCopyMoveMenu = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        ShowAddToPlaces = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowSortBy = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowViewMode = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowOpenInNewTab = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowOpenInNewWindow = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowOpenInSplitView = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowCopyLocation = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowDuplicateHere = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowOpenTerminal = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowCopyToOtherSplitView = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ShowMoveToOtherSplitView = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
      };

      DetailsMode = {
        UseSystemFont = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ViewFont = lib.mkOption {
          type = lib.types.str;
          default = "System Font";
        };
        IconSize = lib.mkOption {
          type = lib.types.int;
          default = 16;
        };
        PreviewSize = lib.mkOption {
          type = lib.types.int;
          default = 48;
        };
        ColumnPositions = lib.mkOption {
          type = lib.types.str;
          default = "0,1,2,3,4,5,6,7,8";
        };
        LeftPadding = lib.mkOption {
          type = lib.types.int;
          default = 20;
        };
        RightPadding = lib.mkOption {
          type = lib.types.int;
          default = 20;
        };
        HighlightEntireRow = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ExpandableFolders = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
      };

      IconsMode = {
        UseSystemFont = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ViewFont = lib.mkOption {
          type = lib.types.str;
          default = "System Font";
        };
        IconSize = lib.mkOption {
          type = lib.types.int;
          default = 32;
        };
        PreviewSize = lib.mkOption {
          type = lib.types.int;
          default = 64;
        };
        TextWidthIndex = lib.mkOption {
          type = lib.types.int;
          default = 1;
        };
        MaximumTextLines = lib.mkOption {
          type = lib.types.int;
          default = 3;
        };
      };

      Settings = {
        HiddenFilesShown = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
      };

      Dolphin = {
        Version = lib.mkOption {
          type = lib.types.int;
          default = -1;
        };
        ViewMode = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
        PreviewsShown = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        GroupedSorting = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        SortRole = lib.mkOption {
          type = lib.types.str;
          default = "text";
        };
        SortOrder = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
        SortFoldersFirst = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        SortHiddenLast = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        VisibleRoles = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };
        HeaderColumnWidths = lib.mkOption {
          type = lib.types.str;
          default = "";
        };
      };

      NotificationMessages = {
        ConfirmOpenManyFolders = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ConfirmOpenManyTerminals = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        ConfirmRenameFileType = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
      };

      VersionControl = {
        enabledPlugins = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };
      };
    };
  };
}
