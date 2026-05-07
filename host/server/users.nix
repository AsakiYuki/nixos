{...}: {
  users.users.asakiyuki.extraGroups = ["wheel" "public"];
  users.users.junko.extraGroups = ["public"];

  users.users.gitea-runner = {
    isSystemUser = true;
    group = "gitea-runner";
    extraGroups = ["docker"];
  };

  users.users.static = {
    group = "public";
    isSystemUser = true;
  };

  users.users.forgejo = {
    group = "forgejo";
    isSystemUser = true;
    useDefaultShell = true;
    home = "/var/lib/forgejo";
    createHome = false;
  };

  users.groups = {
    gitea-runner = {};
    public = {};
    forgejo = {};
  };
}
