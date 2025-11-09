{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable {
    "vimiv/vimiv.conf".text = lib.generators.toINI { } {
      GENERAL.style = "colors";
    };

    "vimiv/styles/colors".text = lib.generators.toINI { } {
      STYLE =
        with osConfig.scheme;
        let
          font = "${builtins.toString osConfig.fonts.preferredSize}pt ${osConfig.fonts.preferred}";
        in
        {
          inherit font;

          base00 = "#${base00}";
          base01 = "#${base01}";
          base02 = "#${base02}";
          base03 = "#${base03}";
          base04 = "#${base04}";
          base05 = "#${base05}";
          base06 = "#${base06}";
          base07 = "#${base07}";
          base08 = "#${base08}";
          base09 = "#${base09}";
          base0a = "#${base0A}";
          base0b = "#${base0B}";
          base0c = "#${base0C}";
          base0d = "#${base0D}";
          base0e = "#${base0E}";
          base0f = "#${base0F}";

          "image.bg" = "#${base00}";
          "image.scrollbar.width" = "8px";
          "image.scrollbar.bg" = "#${base00}";
          "image.scrollbar.fg" = "#${base03}";
          "image.scrollbar.padding" = "2px";

          "library.font" = font;
          "library.fg" = "#${base06}";
          "library.padding" = "2px";
          "library.directory.fg" = "#${base07}";
          "library.even.bg" = "#${base01}";
          "library.odd.bg" = "#${base01}";
          "library.selected.bg" = "#${base0D}";
          "library.selected.fg" = "#${base06}";
          "library.search.highlighted.fg" = "#${base01}";
          "library.search.highlighted.bg" = "#${base04}";
          "library.scrollbar.width" = "8px";
          "library.scrollbar.bg" = "#${base00}";
          "library.scrollbar.fg" = "#${base03}";
          "library.scrollbar.padding" = "2px";
          "library.border" = "0px solid";

          "statusbar.font" = font;
          "statusbar.bg" = "#${base02}";
          "statusbar.fg" = "#${base06}";
          "statusbar.error" = "#${base08}";
          "statusbar.warning" = "#${base09}";
          "statusbar.info" = "#${base0C}";
          "statusbar.message_border" = "2px solid";
          "statusbar.padding" = "4";

          "thumbnail.font" = font;
          "thumbnail.fg" = "#${base06}";
          "thumbnail.bg" = "#${base00}";
          "thumbnail.padding" = "20";
          "thumbnail.selected.bg" = "#${base0D}";
          "thumbnail.search.highlighted.bg" = "#${base04}";
          "thumbnail.default.bg" = "#${base0C}";
          "thumbnail.error.bg" = "#${base08}";
          "thumbnail.frame.fg" = "#${base06}";

          "completion.height" = "16em";
          "completion.fg" = "#${base06}";
          "completion.even.bg" = "#${base02}";
          "completion.odd.bg" = "#${base02}";
          "completion.selected.fg" = "#${base06}";
          "completion.selected.bg" = "#${base0D}";

          "keyhint.padding" = "2px";
          "keyhint.border_radius" = "10px";
          "keyhint.suffix_color" = "#${base0C}";

          "manipulate.fg" = "#${base06}";
          "manipulate.focused.fg" = "#${base0C}";
          "manipulate.bg" = "#${base00}";
          "manipulate.slider.left" = "#${base0D}";
          "manipulate.slider.handle" = "#${base04}";
          "manipulate.slider.right" = "#${base02}";
          "manipulate.image.border" = "2px solid";
          "manipulate.image.border.color" = "#${base0C}";

          "mark.color" = "#${base0E}";
          "keybindings.bindings.color" = "#${base0C}";
          "keybindings.highlight.color" = "#${base0E}";

          "metadata.padding" = "2px";
          "metadata.border_radius" = "10px";

          "image.straighten.color" = "#${base0A}";

          "prompt.font" = font;
          "prompt.fg" = "#${base06}";
          "prompt.bg" = "#${base02}";
          "prompt.padding" = "2px";
          "prompt.border_radius" = "10px";
          "prompt.border" = "2px solid";
          "prompt.border.color" = "#${base0C}";

          "crop.shading" = "#88000000";
          "crop.border" = "2px solid";
          "crop.border.color" = "#88${base04}";
          "crop.grip.color" = "#88FFFFFF";
          "crop.grip.border" = "2px solid";
          "crop.grip.border.color" = "#88${base04}";

          "library.selected.bg.unfocus" = "#88${base0D}";
          "thumbnail.selected.bg.unfocus" = "#88${base0D}";
          "metadata.bg" = "#AA${base02}";
        };
    };
  };
}
