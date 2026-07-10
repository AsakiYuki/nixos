{libs, ...}: {
  users.users.hieze.openssh.authorizedKeys.keys = libs.mkAuthorizedKeys [
    "/home-server/asakiyuki.nixos.pub"
    "/ideapad-slim-5-14apk10/asakiyuki.nixos.pub"
    "/ideapad-slim-5-14apk10/asakiyuki.nixos.wsl.pub"
    "/ideapad-slim-5-14apk10/asakiyuki.windows.pub"
  ] "/assets/public/ssh";
}
