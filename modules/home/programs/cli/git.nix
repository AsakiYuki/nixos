{...}: {
  programs.git = {
    lfs.enable = true;

    settings = {
      user = {
        name = "Asaki Yuki";
        email = "vantrong2007vn@gmail.com";
      };

      init = {
        defaultBranch = "main";
      };

      alias = {
        add-commit = "!git add . && git commit -m ";
        add-commit-push = "!fn() { git add-commit \"$1\"; git push origin HEAD; }; fn";
        fetch-pull = "!git fetch && git pull origin HEAD --rebase";
      };

      # pull = {
      #     rebase = "";
      # };
    };
  };
}
