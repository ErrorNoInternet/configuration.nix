{
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf;
  cursorTheme = pkgs.bibata-cursors;
  cursorThemeName = "Bibata-Modern-Ice";
  cursorThemeSize = 20;
in
{
  environment.sessionVariables = mkIf osConfig.graphical.enable {
    XCURSOR_SIZE = cursorThemeSize;
    XCURSOR_THEME = cursorThemeName;
  };

  xdg.data.files = mkIf osConfig.graphical.enable {
    "icons/default".source = "${cursorTheme}/share/icons/${cursorThemeName}";
  };
}
