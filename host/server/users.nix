{...}: {
  users.users.asakiyuki.extraGroups = ["wheel" "public"];
  users.users.junko.extraGroups = ["public"];

  users.users.static = {
    group = "public";
    isSystemUser = true;
  };

  users.groups = {
    public = {};
  };
}
