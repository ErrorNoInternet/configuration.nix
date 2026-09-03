{ osConfig, ... }:
let
  home = osConfig.hjem.users.error.directory;
  pictures = "${home}/media/pictures";
in
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      audio = {
        enable_overdrive = true;
        enable_sounds = true;
      };

      bar.default = {
        background_opacity = 0.75;
        capsule = true;
        capsule_padding = 10.0;
        capsule_thickness = 0.74;
        center = [
          "workspaces"
          "special-workspaces"
        ];
        end = [
          "privacy"
          "recorder"
          "tray"
          "notifications"
          "volume"
          "group:rf"
          "battery"
          "clock"
        ];
        font_scale = 0.9;
        margin_ends = 0;
        padding = 10;
        radius_top_left = 0;
        radius_top_right = 0;
        start = [
          "launcher"
          "group:resources"
          "media"
        ];

        dead_zone.actions = {
          left = "panel-toggle control-center home";
          middle = "bar-reserve-toggle";
          right = "settings-toggle";
        };

        capsule_group = [
          {
            accordion = false;
            accordion_direction = "end";
            enabled = true;
            fill = "surface_variant";
            id = "resources";
            members = [
              "cpu"
              "ram"
              "sysmon_swap"
              "network_rx"
              "network_tx"
              "sysmon_disk"
            ];
            opacity = 1.0;
            padding = 10.0;
            widget_spacing = 12;
          }
          {
            accordion = false;
            accordion_direction = "end";
            enabled = true;
            fill = "surface_variant";
            id = "rf";
            members = [
              "network"
              "bluetooth"
            ];
            opacity = 1.0;
            padding = 10.0;
          }
        ];
      };

      battery.warning_threshold = 30;

      brightness.enable_ddcutil = true;

      calendar = {
        enabled = true;
        refresh_minutes = 60;

        account.personal_google = {
          name = "Google";
          type = "google";
        };
      };

      control_center = {
        hidden_tabs = [ "screen-time" ];
        width = 850;

        shortcuts = [
          { type = "wifi"; }
          { type = "bluetooth"; }
          { type = "caffeine"; }
          { type = "clipboard"; }
          { type = "nightlight"; }
          { type = "noctalia/screen_recorder:toggle"; }
        ];
      };

      desktop_widgets.enabled = false;

      location.auto_locate = true;

      lockscreen.tint_intensity = 0.6;

      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box"
          "lockscreen-widget-0000000000000001"
          "lockscreen-widget-0000000000000002"
        ];

        grid = {
          cell_size = 64;
          major_interval = 4;
          visible = true;
        };

        widget = {
          lockscreen-login-box = {
            box_height = 196.0;
            box_width = 810.0;
            cx = 960.0;
            cy = 860.0;
            output = "eDP-1";
            placement_height = 1080.0;
            placement_width = 1920.0;
            rotation = 0.0;
            type = "login_box";

            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              center_password_text = false;
              input_opacity = 1.0;
              input_radius = 6.0;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_session_buttons = true;
              show_unlock_hint = true;
              show_weather = true;
            };
          };

          lockscreen-widget-0000000000000001 = {
            box_height = 192.0;
            box_width = 448.0;
            cx = 960.0;
            cy = 348.0;
            output = "eDP-1";
            placement_height = 1080.0;
            placement_width = 1920.0;
            rotation = 0.0;
            type = "clock";

            settings.background = false;
          };

          lockscreen-widget-0000000000000002 = {
            box_height = 64.0;
            box_width = 384.0;
            cx = 960.0;
            cy = 444.0;
            output = "eDP-1";
            placement_height = 1080.0;
            placement_width = 1920.0;
            rotation = 0.0;
            type = "clock";

            settings = {
              background = false;
              format = "{:%A, %B %d, %Y}";
            };
          };
        };
      };

      notification = {
        background_opacity = 0.75;
        layer = "overlay";
      };

      osd = {
        background_opacity = 0.75;

        kinds = {
          dnd = false;
          media = false;
          privacy = false;
        };
      };

      plugin_settings."noctalia/screen_recorder" = {
        copy_to_clipboard = true;
        directory = home;
        hide_inactive = true;
      };

      plugins.enabled = [
        "jamesfeeder/special-workspaces"
        "noctalia/screen_recorder"
        "noctalia/translator"
      ];

      shell = {
        app_icon_color = "on_surface";
        app_icon_colorize = true;
        avatar_path = "${pictures}/profiles/ferris_bg.png";
        clipboard_auto_paste = "off";
        clipboard_history_max_entries = 1000;
        font_family = osConfig.fonts.preferredName;
        polkit_agent = true;

        launcher = {
          auto_paste = "off";
          show_app_actions = true;

          providers.windows.global = false;
        };

        panel = {
          clipboard_placement = "attached";
          launcher_placement = "attached";
          polkit_placement = "attached";
        };

        screenshot.save_to_file = false;
      };

      system.monitor = {
        cpu_poll_seconds = 3;
        disk_poll_seconds = 30;
        memory_poll_seconds = 3;
      };

      theme = {
        builtin = "Kanagawa";

        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
        };
      };

      wallpaper = {
        directory = "${pictures}/wallpapers";
        transition = [ "honeycomb" ];
        transition_on_startup = true;

        default.path = "${pictures}/wallpapers/kanagawa.png";
        last.path = "${pictures}/wallpapers/kanagawa.png";
      };

      widget = {
        battery.actions.right = "power-cycle";

        clock = {
          format = "{:%a, %b %d, %H:%M}";
          tooltip_format = "{:%H:%M:%S %Z}";
        };

        control-center = {
          custom_image = "${pictures}/icons/NixOS.png";
          custom_image_colorize = true;
        };

        launcher = {
          custom_image = "${pictures}/icons/NixOS.png";
          custom_image_colorize = true;
        };

        media = {
          hide_when_no_media = true;
          max_length = 200;
          show_progress = true;
        };

        network = {
          show_label = false;
          show_vpn_label = true;
        };

        privacy = {
          hide_inactive = true;
          icon_spacing = 6;
        };

        recorder.type = "noctalia/screen_recorder:recorder";

        special-workspaces = {
          font_scale = 1.2;
          hide_inactive = true;
          max_label_chars = 3;
          type = "jamesfeeder/special-workspaces:special-workspaces";
        };

        sysmon_disk = {
          glyph = "device-floppy";
          stat = "disk_used_pct";
          type = "sysmon";
        };

        sysmon_swap = {
          stat = "swap_pct";
          type = "sysmon";
        };

        volume.actions.middle = "exec pavucontrol || pwvucontrol";

        workspaces = {
          active_pill_size = 2.0;
          font_scale = 1.2;
        };
      };
    };
  };
}
