{
  lib,
  osConfig,
  pkgs,
  ...
}:
with pkgs;
let
  inherit (lib) mkIf;
  inherit (osConfig.scheme) slug;
  theme =
    if slug == "kanagawa" then
      {
        packages = [
          colloid-icon-theme
          kanagawa-gtk-theme
        ];
        iconName = "Colloid-Dark";
        name = "Kanagawa-BL";
      }
    else if slug == "nord" then
      {
        packages = [
          (colloid-gtk-theme.override { tweaks = [ "nord" ]; })
          (colloid-icon-theme.override { schemeVariants = [ "nord" ]; })
        ];
        iconName = "Colloid-Dark-Nord";
        name = "Colloid-Dark-Nord";
      }
    else
      {
        packages = [
          colloid-gtk-theme
          colloid-icon-theme
        ];
        iconName = "Colloid-Dark";
        name = "Colloid-Dark";
      };
in
{
  rum.misc.gtk = {
    inherit (osConfig.graphical) enable;

    inherit (theme) packages;
    settings = {
      application-prefer-dark-theme = true;
      button-images = true;
      font-name = "${osConfig.fonts.preferred} ${builtins.toString osConfig.fonts.preferredSize}";
      icon-theme-name = theme.iconName;
      menu-images = true;
      theme-name = theme.name;
    };
  };

  environment.sessionVariables = mkIf osConfig.graphical.enable {
    GTK_THEME = theme.name;
  };
}
