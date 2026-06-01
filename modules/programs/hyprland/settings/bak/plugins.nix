{
  # pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    # plugins = with pkgs.hyprlandPlugins; [
    #   hyprscrolling
    # ];

    # settings = {
    #   general.layout = "scrolling";

    #   plugin = {
    #     hyprscrolling = {
    #       column_width = 0.7;
    #       fullscreen_on_one_column = true;
    #     };
    #   };
    # };
  };
}
