{
  osconfig,
  lib,
  ...
}: {
  programs.steam.millennium = lib.mkIf (lib.attrByPath ["programs" "steam" "millennium" "enable"] false osconfig) {
    quickcss = ''
      .qP17eBPXkfezFfexZ4hC3 {
        display: none;
      }
    '';

    # plugins = {
    #   extendium.enable = true;
    #   hltb-millennium-plugin.enable = true;
    #   steamhunter-plugin.enable = true;
    #   steam-size-on-disk.enable = true;
    #   steam-non-steam-playtimes.enable = true;
    # };

    # themes = {
    #   no-more-whats-new.enable = true;
    # };
  };
}
