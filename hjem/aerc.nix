{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.programs.aerc.enable {
    "aerc/aerc.conf".text = lib.generators.toINI { } {
      ui = {
        index-columns = "flags<=,name<20%,subject,date>=";
        this-day-time-format = "15:04:05";
        message-view-timestamp-format = "2006 Jan 02, 15:04:05 GMT-0700";
        sidebar-width = 16;
        mouse-enabled = true;
        styleset-name = "colors";
        msglist-scroll-offset = 5;
      };

      viewer = {
        pager = "less -rc";
      };

      filters = {
        "text/plain" = "colorize";
        "text/calendar" = "calendar";
        "message/delivery-status" = "colorize";
        "message/rfc822" = "colorize";
        "text/html" = "pandoc -f html -t plain | colorize";
        "image/*" = "timg -pq -g$(tput cols)x$(tput cols) -";
        ".headers" = "colorize";
      };

      openers = {
        "text/html" = "firefox";
      };

      hooks = {
        mail-received = ''notify-send -a aerc -i mail-unread "[$AERC_ACCOUNT/$AERC_FOLDER] New mail from $AERC_FROM_NAME" "$AERC_SUBJECT"'';
      };
    };

    "aerc/folder-maps/gmail.map".text = ''
      * = [Gmail]/*
    '';

    "aerc/templates/forward_as_body".text = ''
      X-Mailer: aerc {{version}}

      Forwarded message from {{.OriginalFrom | names | join ", "}} on {{dateFormat .OriginalDate "Mon Jan 2, 2006 at 15:04:05"}}:
      {{.OriginalText}}
      {{- with .Signature }}

      {{.}}
      {{- end }}
    '';

    "aerc/templates/quoted_reply".text = ''
      X-Mailer: aerc {{version}}

      On {{dateFormat (.OriginalDate | toLocal) "Mon Jan 2, 2006 at 15:04:05 MST"}}, {{.OriginalFrom | names | join ", "}} wrote:
      {{trimSignature .OriginalText | quote}}
      {{- with .Signature }}

      {{.}}
      {{- end }}
    '';

    "aerc/stylesets/colors".text = lib.generators.toINIWithGlobalSection { } {
      globalSection = with osConfig.scheme; {
        "*.default" = true;
        "*.normal" = true;

        "title.reverse" = true;
        "header.bold" = true;

        "*error.bold" = true;
        "*error.fg" = "red";
        "*warning.fg" = "yellow";
        "*success.fg" = "green";

        "completion_pill.reverse" = true;

        "border.fg" = "#${base03}";

        "selector_focused.reverse" = true;
        "selector_chooser.bold" = true;

        "*.selected.bold" = true;
        "*.selected.bg" = "#${base02}";

        "msglist_marked.bg" = "#${base03}";
        "msglist_flagged.fg" = "#${base0B}";
        "msglist_flagged.bold" = true;

        "msglist_unread.fg" = "#${base13}";

        "msglist_pill.reverse" = true;

        "statusline*.default" = true;
        "statusline_default.bg" = "#${base01}";
        "statusline_default.fg" = "#${base04}";

        "tab.fg" = "#${base04}";
        "tab.bg" = "#${base01}";
        "tab.selected.bg" = "#${base04}";
        "tab.selected.fg" = "#${base01}";

        "dirlist_unread.fg" = "#${base13}";
        "dirlist_recent.fg" = "#${base13}";

        "part_*.fg" = "#${base06}";
        "part_mimetype.fg" = "#${base03}";
        "part_*.selected.fg" = "#${base06}";
        "part_filename.selected.bold" = true;
      };

      sections.viewer = {
        "*.default" = true;
        "*.normal" = true;
        "url.underline" = true;
        "header.bold" = true;
        "signature.dim" = true;
        "diff_meta.bold" = true;
        "diff_chunk.dim" = true;
        "diff_add.fg" = "2";
        "diff_del.fg" = "1";
        "quote_*.fg" = "6";
        "quote_*.dim" = true;
        "quote_1.dim" = false;
      };
    };
  };
}
