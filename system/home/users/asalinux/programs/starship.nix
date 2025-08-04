{ ... }:
let
    STARSHIP = import ../../../../../root/programs/starship.nix {};
in
{
    programs.starship = STARSHIP;
}