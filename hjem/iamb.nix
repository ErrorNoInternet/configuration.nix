{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:
{
  xdg.config.files = lib.mkIf (osConfig.host.name == "zenith") {
    "iamb/config.toml".source = (pkgs.formats.toml { }).generate "config.toml" {
      default_profile = "default";

      profiles.default = {
        user_id = "@errornointernet:matrix.org";
        url = "https://matrix.org";
      };

      settings = {
        external_edit_file_suffix = ".md";
        log_level = "warn";
        message_shortcode_display = false;
        open_command = [
          "xdg-open"
          "--file"
        ];
        reaction_display = true;
        reaction_shortcode_display = false;
        read_receipt_display = true;
        read_receipt_send = true;
        request_timeout = 10000;
        typing_notice_display = true;
        typing_notice_send = true;
        user_gutter_width = 30;
        username_display = "username";

        image_preview = {
          protocol.type = "kitty";
          size = {
            width = 66;
            height = 10;
          };
        };

        notifications = {
          enabled = true;
        };

        sort = {
          rooms = [
            "favorite"
            "lowpriority"
            "unread"
            "name"
          ];
          members = [
            "power"
            "id"
          ];
        };
      };

      layout = {
        style = "config";
        tabs = [ { window = "iamb://rooms"; } ];
      };

      macros = {
        insert."jj" = "<Esc>";
        "normal|visual"."V" = "<C-W>m";
      };

      dirs = {
        cache = "${config.xdg.cache.directory}/iamb/";
        logs = "${config.xdg.data.directory}/iamb/logs/";
        downloads = "${config.directory}/downloads/";
      };
    };
  };
}
