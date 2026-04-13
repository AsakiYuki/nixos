{...}: {
  device = {
    flake-name = "home-server";

    programs = {
      fastfetch.enable = true;
      starship.enable = true;
    };
  };
}
