{...}: {
  users.groups = {
    gitea-runner = {};
    public = {
      members = ["nextcloud"];
    };
    forgejo = {};
  };
}
