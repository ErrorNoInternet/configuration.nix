{
  config,
  inputs',
  lib,
  self,
  ...
}: let
  cfg = config.wallpaper;
  inherit (lib) mkEnableOption mkOption mkIf types;

  wallpapersPath = "~/pictures/wallpapers";
in {
  options.wallpaper = {
    enable = mkEnableOption "";

    path = mkOption {
      default = "nord/3.png";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = [inputs'.hyprpaper.packages.hyprpaper];
      file = {
        "pictures/wallpapers".source = "${self}/other/wallpapers";

        "${config.xdg.configHome}/hypr/hyprpaper.conf".text = ''
          preload = ${wallpapersPath}/${cfg.path}
          wallpaper = ,${wallpapersPath}/${cfg.path}
        '';
      };
    };
  };
}
