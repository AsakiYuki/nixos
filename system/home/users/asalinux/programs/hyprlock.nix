{ ...  }:
let
    FONT = "Segoe UI";
    NERF_FONT = "Sauce Code Pro Nerd Font";
    WALLPAPER = "/etc/nixos/root/wallpaper.jpg";

    TEXT_COLOR = "rgb(205, 214, 244)";
    SUBTEXT_COLOR = "rgb(88, 91, 112)";
    TEXTBOX_BG_COLOR = "rgba(17, 17, 27, 0.25)";

    BG_BRIGHTNESS = 0.6;
    BG_BLUR = 2;
    BG_BLUR_PASSES = 1;
in
{
    enable = true;
    settings = {
        general.hide_cursor =  false;
        
        animation = {
            enabled = true;
            bezier = "linear, 1, 1, 0, 0";
            animation = [
                "fadeIn, 1, 5, linear"
                "fadeOut, 1, 5, linear"
                "inputFieldDots, 1, 2, linear"
            ];
        };

        background = {
            path = WALLPAPER;
            brightness = BG_BRIGHTNESS;
            blur_size = BG_BLUR;
            blur_passes = BG_BLUR_PASSES;
        };

        input-field = {
            font_family = FONT;

            placeholder_text = "Type to unlock...";
            fail_text = "Incorrect password, try again.";

            fade_on_empty = false;
            font_color = TEXT_COLOR;
            outline_thickness = 0;

            inner_color = TEXTBOX_BG_COLOR;
            capslock_color = TEXTBOX_BG_COLOR;
            numlock_color = TEXTBOX_BG_COLOR;
            bothlock_color = TEXTBOX_BG_COLOR;
            check_color = TEXTBOX_BG_COLOR;
            fail_color = TEXTBOX_BG_COLOR;

            size = "300, 40";
            position = "0, -125";
            halign = "center";
            valign = "center";
        };

        label = [
            {
                text = "cmd[update:50] /etc/nixos/root/scripts/capslock.sh";
                color = TEXT_COLOR;
                position = "0, -175";
                halign = "center";
                valign = "center";
                font_family = "${FONT} Bold";
                font_size = 11;
            }
            
            {
                text = "cmd[update:500] /etc/nixos/root/scripts/bottom-text.sh";

                color = TEXT_COLOR;
                font_size = 11;
                font_family = "${FONT}, ${NERF_FONT}";
                font_color = SUBTEXT_COLOR;

                position = "0, 18";
                halign = "center";
                valign = "bottom";
            }

            {
                text = "cmd[update:1000] date +'%H:%M:%S'";
                color = TEXT_COLOR;
                font_size = 45;
                font_family = "${FONT} Bold";

                position = "0, 200";
                halign = "center";
                valign = "center";
            }

            {
                text =  "cmd[update:60000] date +'%A, %d %B'";
                color = TEXT_COLOR;
                font_size = 15;
                font_family = "${FONT} Bold";

                position = "0, 150";
                halign = "center";
                valign = "center";
            }
        ];
    };
}