{ ... }:
{
    enable = true;
    lfs.enable = true;
    config = {
        init = { defaultBranch = "main"; };
        alias = {};
        user = {
            email = "vantrong2007vn@gmail.com";
            name = "Asaki Yuki";
        };
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