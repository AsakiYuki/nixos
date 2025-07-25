{ ... }:
{
    vesktop = {
        name = "Vesktop";
        genericName = "Internet Messenger";
        comment = "A Discord client using Vencord and Electron";
        exec = "vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland --gtk-version=4 %U";
        icon = "vesktop";
        type = "Application";
        terminal = false;
    };
}