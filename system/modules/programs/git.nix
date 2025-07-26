{ ... }:
{
    enable = true;
    lfs.enable = true;
    config = {
        {
            init = { defaultBranch = "main"; };
            alias = {};
            user = {
                email = "vantrong2007vn@gmail.com";
                name = "Trong Nguyen";
            };
            url = {
                "https://github.com/" = {
                    insteadOf = [
                        "gh:"
                        "github:"
                    ];
                };
            };
        };
    };
}