{
  config,
  lib,
  pkgs,
  self',
  ...
}:
let
  cfg = config.graphical;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.graphical = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    spicetify.enable = true;

    programs = {
      firefox.enable = true;
    };

    environment.systemPackages = with pkgs; [
      bibata-cursors
      cava
      galaxy-buds-client
      gimp3-with-plugins
      grim
      pavucontrol
      playerctl
      qalculate-gtk
      ripdrag
      satty
      slurp
      timg
      vesktop
    ];
  };
}
