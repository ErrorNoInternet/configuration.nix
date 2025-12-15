{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.snapper;
  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    ;
in
{
  options.snapper = {
    enable = mkEnableOption "" // {
      default = true;
    };

    interval = mkOption {
      default = "hourly";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services.snapper = {
      snapshotInterval = cfg.interval;

      configs = {
        home = {
          SUBVOLUME = "/home";
          TIMELINE_CREATE = true;
          TIMELINE_CLEANUP = true;

          TIMELINE_LIMIT_HOURLY = 24;
          TIMELINE_LIMIT_DAILY = 7;
          TIMELINE_LIMIT_WEEKLY = 0;
          TIMELINE_LIMIT_MONTHLY = 0;
          TIMELINE_LIMIT_YEARLY = 0;
        };

        persist = {
          SUBVOLUME = "/persist";
          TIMELINE_CREATE = true;
          TIMELINE_CLEANUP = true;

          TIMELINE_LIMIT_HOURLY = 24;
          TIMELINE_LIMIT_DAILY = 7;
          TIMELINE_LIMIT_WEEKLY = 0;
          TIMELINE_LIMIT_MONTHLY = 0;
          TIMELINE_LIMIT_YEARLY = 0;
        };
      };
    };

    environment.systemPackages = [ pkgs.snapper ];
  };
}
