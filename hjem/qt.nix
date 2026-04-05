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
        active_colors=#c8c093, #1f1f28, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #c8c093, #ffffff, #c8c093, #1f1f28, #1f1f28, #1f1f28, #21321a, #e4eae1, #c0a36e, #76946a, #2a2a37, #1f1f28, #2a2a37, #c8c093, #c8c093, #76946a
        disabled_colors=#c8c093, #1f1f28, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #c8c093, #ffffff, #c8c093, #1f1f28, #1f1f28, #1f1f28, #21321a, #e4eae1, #c0a36e, #76946a, #2a2a37, #1f1f28, #2a2a37, #c8c093, #c8c093, #76946a
        inactive_colors=#c8c093, #1f1f28, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #c8c093, #ffffff, #c8c093, #1f1f28, #1f1f28, #1f1f28, #21321a, #e4eae1, #c0a36e, #76946a, #2a2a37, #1f1f28, #2a2a37, #c8c093, #c8c093, #76946a
      ''
    else if slug == "nord" then
      writeText "nord.conf" ''
        [ColorScheme]
        active_colors=#eceff4, #2e3440, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #eceff4, #ffffff, #eceff4, #2e3440, #2e3440, #2e3440, #2e6b69, #dfecec, #88c0d0, #8fbcbb, #3b4252, #2e3440, #3b4252, #eceff4, #eceff4, #8fbcbb
        disabled_colors=#eceff4, #2e3440, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #eceff4, #ffffff, #eceff4, #2e3440, #2e3440, #2e3440, #2e6b69, #dfecec, #88c0d0, #8fbcbb, #3b4252, #2e3440, #3b4252, #eceff4, #eceff4, #8fbcbb
        inactive_colors=#eceff4, #2e3440, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #eceff4, #ffffff, #eceff4, #2e3440, #2e3440, #2e3440, #2e6b69, #dfecec, #88c0d0, #8fbcbb, #3b4252, #2e3440, #3b4252, #eceff4, #eceff4, #8fbcbb
      ''
    else
      "${pkgs.qt6Packages.qt6ct}/share/qt6ct/colors/darker.conf";

  stylesheets = writeText "custom-fixes.qss" /* css */ ''
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
