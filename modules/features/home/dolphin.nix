{...}: {
  programs.dolphin.configs = {
    General = {
      RememberOpenedTabs = false;
      ModifiedStartupSettings = true;
      FilterBar = true;
    };
    ContextMenu = {
      ShowOpenTerminal = false;
    };
  };
}
