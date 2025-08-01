{ ... }:
let
    LOCK = "pidof hyprlock || hyprlock";
    SUSPEND = "systemctl suspend || loginctl suspend";
in
{
    enable = true;
    settings = {
        general = {
            lock_cmd = LOCK;
            before_sleep_cmd = "loginctl lock-session";
        };

        listener = {
            timeout = 900; # 15mins
            on-timeout = "loginctl lock-session";
        };

        listener = {
            timeout = 2700; # 45mins
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
        };

        listener = {
            timeout = 3600; # 1 hour
            on-timeout = SUSPEND;
        };
    };
}
