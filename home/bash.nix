{ ... }:
{
  enable =  true;
  shellAliases = {
    cls = "clear";
    ff = "fastfetch";
    btw = "echo i use nixos, btw";
    nrs = "sudo nixos-rebuild switch";
    restart-shell = "pkill quickshell; nohup quickshell > /dev/null 2>&1 &";
    nix-list = "nix-store -q --references /run/current-system/sw";
  };
}
