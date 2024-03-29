{
  config,
  lib,
  ...
}: let
  cfg = config.caches.garnix;
  inherit (lib) mkEnableOption mkIf;
in {
  options.caches.garnix.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = [
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
    };
  };
}
