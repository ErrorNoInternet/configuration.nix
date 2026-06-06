{
  config,
  lib,
  ...
}:
let
  cfg = config.kmscon;
  inherit (lib)
    mkDefault
    mkEnableOption
    mkIf
    mkOption
    types
    ;
in
{
  options.kmscon = {
    enable = mkEnableOption "";

    dpmsTimeout = mkOption {
      type = types.int;
      default = 15 * 60;
    };
  };

  config = mkIf cfg.enable {
    services.kmscon = {
      enable = mkDefault true;

      config = {
        dpms-timeout = cfg.dpmsTimeout;
        font-name = config.fonts.preferredName;
        font-size = config.fonts.preferredSize + 4;
        hwaccel = mkDefault true;
        term = "xterm-256color";
        xkb-repeat-delay = config.graphical.repeatDelay;
        xkb-repeat-rate = config.graphical.repeatRate;
      };
    };
  };
}
