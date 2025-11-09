{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.irssi;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.programs.irssi = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.irssi ];
  };
}
