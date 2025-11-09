{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.btop;
  inherit (lib)
    mkEnableOption
    mkIf
    mkOption
    types
    ;
in
{
  options.programs.btop = {
    enable = mkEnableOption "" // {
      default = true;
    };

    variant = mkOption {
      type = types.str;
      default = "";
    };

    package = mkOption {
      type = types.package;
      readOnly = true;
      default =
        if cfg.variant == "cuda" then
          pkgs.btop-cuda
        else if cfg.variant == "rocm" then
          pkgs.btop-rocm
        else
          pkgs.btop;
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };
}
