{
  config,
  lib,
  ...
}: let
  cfg = config.profiles.desktop;
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.desktop = {
    enable = mkEnableOption "";
    enableNvidia = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    cursor.enable = true;

    mimeapps.image.enable = true;

    toolkits = {
      gtk.enable = true;
      qt.enable = true;
    };

    nvidia.desktopEntries.enable = cfg.enableNvidia;
  };
}
