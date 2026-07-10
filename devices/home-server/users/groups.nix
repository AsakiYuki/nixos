{...}: {
  users.groups = {
    gitea-runner = {};
    public = {
      members = ["nextcloud"];
    };
    forgejo = {};
    host = {
      members = ["asakiyuki" "hieze"];
    };
    mc-bedrock = {
      members = ["asakiyuki" "hieze"];
    };
  };
}
