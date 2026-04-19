{...}: {
  users.users.asakiyuki.extraGroups = ["wheel" "public"];
  users.users.junko.extraGroups = ["public"];

  users.users.static = {
    group = "public";
    isSystemUser = true;
  };

  users.users.git = {
    group = "forgejo";
    isSystemUser = true;
    useDefaultShell = true;
    home = "/var/lib/forgejo";
    createHome = false;
  };

  users.groups = {
    public = {};
    forgejo = {};
  };
}
