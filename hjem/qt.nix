{
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (pkgs) writeText;
  inherit (osConfig.scheme) slug;

  color_scheme_path =
    if slug == "kanagawa" then
      writeText "kanagawa.conf" ''
        [ColorScheme]
        active_colors=#ffffff, #1f1f28, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #ffffff, #ffffff, #ffffff, #1f1f28, #1f1f28, #000000, #436038, #ffffff, #c0a36e, #76946a, #1f1f28, {{colors.scrim.default.hex}}, #1f1f28, #ffffff, #c0a36e
        disabled_colors=#ffffff, #1f1f28, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #ffffff, #ffffff, #ffffff, #1f1f28, #1f1f28, #000000, #436038, #ffffff, #c0a36e, #76946a, #1f1f28, {{colors.scrim.default.hex}}, #1f1f28, #ffffff, #c0a36e
        inactive_colors=#ffffff, #1f1f28, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #ffffff, #ffffff, #ffffff, #1f1f28, #1f1f28, #000000, #436038, #ffffff, #c0a36e, #76946a, #1f1f28, {{colors.scrim.default.hex}}, #1f1f28, #ffffff, #c0a36e
      ''
    else if slug == "nord" then
      writeText "nord.conf" ''
        [ColorScheme]
        active_colors=#ffffff, #2e3440, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #ffffff, #ffffff, #ffffff, #2e3440, #2e3440, #000000, #326766, #ffffff, #88c0d0, #8fbcbb, #2e3440, {{colors.scrim.default.hex}}, #2e3440, #ffffff, #88c0d0
        disabled_colors=#ffffff, #2e3440, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #ffffff, #ffffff, #ffffff, #2e3440, #2e3440, #000000, #326766, #ffffff, #88c0d0, #8fbcbb, #2e3440, {{colors.scrim.default.hex}}, #2e3440, #ffffff, #88c0d0
        inactive_colors=#ffffff, #2e3440, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #ffffff, #ffffff, #ffffff, #2e3440, #2e3440, #000000, #326766, #ffffff, #88c0d0, #8fbcbb, #2e3440, {{colors.scrim.default.hex}}, #2e3440, #ffffff, #88c0d0
      ''
    else
      "${pkgs.qt6Packages.qt6ct}/share/qt6ct/colors/darker.conf";

  stylesheets = writeText "custom-fixes.qss" ''
    QMenuBar, QMenu, QToolBar, QStatusBar, QFrame, QScrollBar {
        border: none;
        color: palette(bright-text);
    }
    QTabBar::tab:selected {
        color: palette(bright-text);
    }
    QScrollBar {
        background: palette(dark);
        width: 4px;
    }
    QScrollBar::handle {
        background: palette(highlight);
        border-radius: 4px;
    }
    QScrollBar::add-line, QScrollBar::sub-line {
        background: palette(window);
    }
  '';
in
{
  xdg.config.files =
    let
      qtConf = lib.generators.toINI { } {
        Appearance = {
          icon_theme =
            let
              inherit (osConfig.scheme) slug;
            in
            if slug == "nord" then "Colloid-Nord-Dark" else "Colloid-Dark";

          inherit color_scheme_path;
          custom_palette = true;
          style = "Breeze";
        };

        Interface = {
          inherit stylesheets;
          gui_effects = "General, AnimateMenu, AnimateCombo, AnimateTooltip, AnimateToolBox";
        };
      };
    in
    mkIf osConfig.graphical.enable {
      "qt5ct/qt5ct.conf".text = qtConf;
      "qt6ct/qt6ct.conf".text = qtConf;
    };

  environment.sessionVariables = mkIf osConfig.graphical.enable {
    QT_FONT_DPI = 84;
    QT_WAYLAND_RECONNECT = 1;
  };
}
