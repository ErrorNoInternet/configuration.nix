{
  rum.desktops.hyprland.settings = {
    animations = {
      bezier = "extremeEaseOut, 0, 1, 0, 1";
      animation = [
        "fade,             1, 3, default"
        "layers,           1, 3, extremeEaseOut, popin 50%"
        "layersOut,        1, 3, extremeEaseOut, popin 75%"
        "windows,          1, 3, extremeEaseOut, popin 50%"
        "windowsOut,       1, 3, default,        popin 75%"
        "workspaces,       1, 2, extremeEaseOut, slidefade 50%"
        "specialWorkspace, 1, 2, extremeEaseOut, slidefadevert -50%"
      ];
    };

    decoration = {
      rounding = 12;
      rounding_power = 4;

      blur = {
        passes = 3;
        size = 8;
        popups = true;
        popups_ignorealpha = 0.65;
        input_methods = true;
        input_methods_ignorealpha = 0.4;
      };

      shadow = {
        enabled = true;
        range = 25;
        render_power = 3;
        color = "$base00";
      };
    };

    misc = {
      animate_manual_resizes = true;
      animate_mouse_windowdragging = true;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };

    group = {
      "col.border_active" = "$base05";
      "col.border_inactive" = "$base03";
      "col.border_locked_active" = "$base04";
      "col.border_locked_inactive" = "$base03";

      groupbar = {
        indicator_height = 4;
        render_titles = false;
        rounding = 2;
        "col.active" = "$base05";
        "col.inactive" = "$base03";
        "col.locked_active" = "$base04";
        "col.locked_inactive" = "$base03";
      };
    };

    general = {
      border_size = 2;
      gaps_in = 4;
      gaps_out = 8;
      "col.active_border" = "$base05";
      "col.inactive_border" = "$base03";
    };
  };
}
