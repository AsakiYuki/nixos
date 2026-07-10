{...}: {
  users.groups = {
    gitea-runner = {};
    public = {
      members = ["nextcloud"];
    };
    forgejo = {};
    mc-bedrock = {
      members = ["asakiyuki" "hieze"];
    };
  };
}
