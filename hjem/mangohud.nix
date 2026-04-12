{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable {
    "MangoHud/MangoHud.conf".text = ''
      full
      media_player=off
      no_display
      time_no_label
      version=off
    '';
  };
}
