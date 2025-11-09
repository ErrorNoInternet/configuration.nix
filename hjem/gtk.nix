{ osConfig, pkgs, ... }:
{
  rum.misc.gtk =
    with pkgs;
    let
      slug = osConfig.scheme.slug;
      theme =
        if slug == "kanagawa" then
          {
            packages = [
              kanagawa-gtk-theme
              kanagawa-icon-theme
            ];
            iconName = "oomox-Kanagawa";
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
      enable = true;

      packages = theme.packages;
      settings = {
        application-prefer-dark-theme = true;
        button-images = true;
        font-name = "${osConfig.fonts.preferred} ${builtins.toString osConfig.fonts.preferredSize}";
        icon-theme-name = theme.iconName;
        menu-images = true;
        theme-name = theme.name;
      };
    };
}
