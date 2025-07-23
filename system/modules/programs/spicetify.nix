{ inputs, pkgs, ...}:
let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system}; in
{
    enable = true;
    
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";

    enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle
    ];

    enabledCustomApps = with spicePkgs.apps; [
        newReleases
        lyricsPlus
        marketplace
    ];

    enabledSnippets = with spicePkgs.snippets; [];
}