{ pkgs, ... }:
let
  cursorTheme = pkgs.bibata-cursors;
  cursorThemeName = "Bibata-Modern-Ice";
  cursorThemeSize = 20;
in
{
  environment.sessionVariables = {
    XCURSOR_SIZE = cursorThemeSize;
    XCURSOR_THEME = cursorThemeName;
  };

  xdg.data.files."icons/default".source = "${cursorTheme}/share/icons/${cursorThemeName}";
}
