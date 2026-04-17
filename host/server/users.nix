{...}: {
  users.users.asakiyuki.extraGroups = ["wheel" "public"];
  users.users.junko.extraGroups = ["public"];

  users.users.public = {
    extraGroups = ["public"];
    isSystemUser = true;
  };

  users.groups = {
    public = {};
  };
}
