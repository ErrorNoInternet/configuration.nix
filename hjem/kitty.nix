{
  config,
  lib,
  osConfig,
  self',
  ...
}:
{
  rum.programs.kitty = {
    inherit (osConfig.graphical) enable;
    package = self'.packages.kitty;
    integrations.fish.enable = config.rum.programs.fish.enable;

    settings =
      with osConfig.scheme.withHashtag;
      let
        symbolMap = [
          "2211"
          "23CE"
          "23F1"
          "23F8"
          "25CB"
        ];
      in
      {
        box_drawing_scale = "0.001, 0.75, 1, 1.5";
        font_family = osConfig.fonts.preferred;
        font_size = osConfig.fonts.preferredSize;
        symbol_map = "${lib.concatStringsSep "," (map (char: "U+${char}") symbolMap)} Unifont";

        background_opacity = 0.8;
        confirm_os_window_close = 0;
        remember_window_size = false;
        resize_debounce_time = "0 0";
        window_padding_width = 5;

        command_on_bell = "sh -c 'notify-send -e -t 3000 Terminal \"\${KITTY_TAB_TITLE%% *} has rung the bell!\"'";
        enable_audio_bell = false;

        cursor_trail = 0;
        cursor_trail_decay = "0.08 0.2";
        cursor_trail_start_threshold = 0;

        shell = "tmux";
        shell_integration = "no-rc no-cursor";

        map = [
          "ctrl+shift+minus change_font_size all -0.5"
          "ctrl+shift+equal change_font_size all +0.5"
        ];

        background = base00;
        foreground = base05;
        selection_background = base02;
        selection_foreground = base04;
        url_color = base16;
        cursor = base04;

        active_tab_background = base00;
        active_tab_foreground = base04;
        inactive_tab_background = base00;
        inactive_tab_foreground = base03;

        color0 = base01;
        color1 = base08;
        color2 = base0B;
        color3 = base0A;
        color4 = base0D;
        color5 = base0E;
        color6 = base0C;
        color7 = base04;

        color8 = base03;
        color9 = base12;
        color10 = base14;
        color11 = base13;
        color12 = base16;
        color13 = base17;
        color14 = base15;
        color15 = base05;

        color16 = base09;
        color17 = base0F;
      }
      // lib.optionalAttrs (osConfig.fonts.preferred == "JetBrainsMonoNL Nerd Font") {
        modify_font = "baseline 1";
      };
  };
}
