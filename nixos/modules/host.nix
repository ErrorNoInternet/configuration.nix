{ config, lib, ... }:
let
  cfg = config.host;
  inherit (lib) mkOption types;
in
{
  options.host = {
    name = mkOption { type = types.str; };
  };

  config = {
    environment.variables.HOSTNAME = cfg.name;
    networking.hostName = cfg.name;
  };
}
