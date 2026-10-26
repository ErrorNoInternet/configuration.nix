{ config, lib, ... }:
let
  cfg = config.zswap;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.zswap = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    zramSwap.enable = false;

    boot = {
      kernelParams = [
        "zswap.enabled=1"
        "zswap.max_pool_percent=25"
      ];

      kernel.sysctl."vm.swappiness" = 60;
    };
  };
}
