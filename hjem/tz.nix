{ pkgs, ... }:
{
  xdg.config.files."tz/conf.toml".source = (pkgs.formats.toml { }).generate "conf.toml" {
    zones = [
      {
        id = "Europe/Stockholm";
        name = "Stockholm";
      }
      {
        id = "America/New_York";
        name = "New York";
      }
      {
        id = "America/Los_Angeles";
        name = "Los Angeles";
      }
      {
        id = "Asia/Yekaterinburg";
        name = "Yekaterinburg";
      }
      {
        id = "UTC";
        name = "UTC";
      }
    ];

    keymaps = {
      prev_minute = [ "-" ];
      next_minute = [ "+" ];
      zero_minute = [ "0" ];

      prev_hour = [
        "h"
        "left"
      ];
      next_hour = [
        "l"
        "right"
      ];

      prev_day = [
        "k"
        "up"
      ];
      next_day = [
        "j"
        "down"
      ];

      prev_week = [
        "p"
        "<"
      ];
      next_week = [
        "n"
        ">"
      ];

      prev_line_select = [ "," ];
      next_line_select = [ "." ];

      next_format_style = [ "f" ];
      prev_format_style = [ "F" ];

      next_zone_style = [ "z" ];
      prev_zone_style = [ "Z" ];

      toggle_date = [ "d" ];
      open_web = [
        "o"
        "x"
      ];

      now = [ "t" ];
      help = [ "f1" ];

      quit = [
        "q"
        "esc"
        "ctrl+c"
      ];
    };
  };
}
