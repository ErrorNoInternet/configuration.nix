{
  config,
  lib,
  ...
}:
with config.colorScheme.colors; {
  config = lib.mkIf config.profiles.windowManager.enable {
    services.dunst = {
      enable = true;
      iconTheme = config.gtkCustomization.iconTheme;
      settings = {
        global = {
          origin = "top-right";
          offset = "10x10";
          follow = "mouse";
          notification_limit = 8;
          font = "${config.font.name} 9";
          corner_radius = 10;
          icon_corner_radius = 5;
          mouse_left_click = "close_current";
          mouse_middle_click = "do_action, close_current";
          mouse_right_click = "close_all";
        };
        urgency_low = {
          background = "#${base00}";
          foreground = "#${base06}";
          frame_color = "#${base03}";
          timeout = 5;
        };
        urgency_normal = {
          background = "#${base00}";
          foreground = "#${base06}";
          frame_color = "#${base0C}";
          timeout = 10;
        };
        urgency_critical = {
          background = "#${base00}";
          foreground = "#${base06}";
          frame_color = "#${base08}";
          timeout = 0;
        };
      };
    };
  };
}
