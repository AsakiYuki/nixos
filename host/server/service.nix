{ libs, ... }: [
    imports = [
        (libs.root "/modules/services/adguardhome.nix")
    ];
]