{ pkgs, ... }:
{
    enable = true;
    keyMode = "vi";
    disableConfirmationPrompt = true;

    extraConfig = ''
        set-option -g destroy-unattached on
        
        unbind r
        bind r source-file ~/.config/tmux/tmux.conf;
    ''; 

    plugins = with pkgs.tmuxPlugins; [
        {
            plugin = catppuccin;
            extraConfig = "set -g @catppuccin_flavor 'mocha'";
        }
        {
            plugin = cpu;
            extraConfig = ''
                # Special Variables
                set -ogq @asa-module-icon "#[bg=#{E:@thm_sapphire},fg=#{E:@thm_surface_0}]"
                set -ogq @asa-module-text "#[bg=#{E:@thm_surface_0},fg=#{E:@thm_fg}]"

                # Window Status
                set -g window-status-current-format "#{E:@asa-module-icon} #I #{E:@asa-module-text} #W "

                # Status left panel.
                set -g status-left ""

                # Status right panel
                set -g status-right "#{E:@asa-module-icon}  #{E:@asa-module-text} #S #[default] "
                set -ag status-right "#{E:@asa-module-icon} CPU #{E:@asa-module-text} #{cpu_percentage} #[default] "
                set -ag status-right "#{E:@asa-module-icon} RAM #{E:@asa-module-text} #{ram_percentage} #[default] "
                set -ag status-right "#{E:@asa-module-text} %a %d/%m #[default] "
                set -ag status-right "#{E:@asa-module-text} %H:%M "

                set -g status-right-length 100
            '';
        }
    ];
}