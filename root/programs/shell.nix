{ ... }:
{
    shellAliases = {
        cls = "clear";
        ff = "fastfetch";
        btw = "echo i use nixos, btw";
        nrs = "sudo nixos-rebuild switch";
        
        nix-cleanup = "sudo nix-collect-garbage -d";
        nix-cleanup-generations = "sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system";
    };
}