{ ... }:
{
    lfs.enable = true;

    userEmail = "vantrong2007vn@gmail.com";
    userName = "Asaki Yuki";
    aliases = {};
    ignores = [];

    extraConfig = {
        url = {
            "git@github.com:" = {
                insteadOf = [
                    "https://github.com/"
                    "gh:"
                    "github:"
                ];
            };
        };
    };
}