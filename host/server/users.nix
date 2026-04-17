{...}: {
  users.users.asakiyuki.extraGroups = ["wheel" "public"];
  users.users.junko.extraGroups = ["public"];

  users.groups = {
    public = {};
  };
}
