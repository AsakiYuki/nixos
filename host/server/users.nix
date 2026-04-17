{...}: {
  users.users.asakiyuki.extraGroups = ["wheel" "public"];
  users.users.junko.extraGroups = ["public"];

  users.users.public = {
    group = "public";
    isSystemUser = true;
  };

  users.groups = {
    public = {};
  };
}
