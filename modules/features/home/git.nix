{...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user = {
        name = "Asaki Yuki";
        email = "vantrong2007vn@gmail.com";
      };

      init = {
        defaultBranch = "main";
      };

      # pull = {
      #     rebase = "";
      # };
    };
  };
}
