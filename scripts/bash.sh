function get-hash() {
    nix hash convert --hash-algo sha256 --from nix32 $(nix-prefetch-url --unpack "$1")
}

function nixos-rollback() {
    sudo nix-env --switch-generation $1 -p /nix/var/nix/profiles/system
    sudo /nix/var/nix/profiles/system/bin/switch-to-configuration switch
}

function nixos-list-generations() {
    sudo nix-env --list-generations -p /nix/var/nix/profiles/system
}

function get-process-env-vars() {
    xargs -0 -L1 -a /proc/$1/environ
}