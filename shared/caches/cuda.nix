{
  config,
  lib,
  ...
}: let
  cfg = config.caches.cuda;
  inherit (lib) mkEnableOption mkIf;
in {
  options.caches.cuda.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = [
        "https://cuda-maintainers.cachix.org"
      ];
      trusted-public-keys = [
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };
  };
}
