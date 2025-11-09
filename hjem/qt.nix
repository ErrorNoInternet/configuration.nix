{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:
{
  xdg.config.files =
    let
      qtConf = lib.generators.toINI { } {
        Appearance = {
          icon_theme =
            let
              slug = osConfig.scheme.slug;
            in
            if slug == "nord" then "Colloid-Nord-Dark" else "Colloid-Dark";

          color_scheme_path = "${pkgs.qt6Packages.qt6ct}/share/qt6ct/colors/darker.conf";
          custom_palette = true;
          style = "Breeze";
        };

        Interface = {
          gui_effects = "General, AnimateMenu, AnimateCombo, AnimateTooltip, AnimateToolBox";
          stylesheets = "${pkgs.qt6Packages.qt6ct}/share/qt6ct/qss/fusion-fixes.qss";
        };
      };
    in
    {
      "qt5ct/qt5ct.conf".text = qtConf;
      "qt6ct/qt6ct.conf".text = qtConf;
    };

  environment.sessionVariables = {
    QT_FONT_DPI = 84;
    QT_WAYLAND_RECONNECT = 1;
  };
}
