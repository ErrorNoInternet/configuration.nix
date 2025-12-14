{
  config,
  lib,
  ...
}:
let
  cfg = config.substituters;
  inherit (lib)
    mkEnableOption
    mkIf
    optionals
    ;
in
{
  options.substituters = {
    enable = mkEnableOption "" // {
      default = true;
    };

    cachix = mkEnableOption "" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = optionals cfg.cachix [
        "https://errornobinaries.cachix.org"
      ];
      trusted-public-keys = optionals cfg.cachix [
        "errornobinaries.cachix.org-1:84oagGNCIsXxBTYmfTiP+lvWje7lIS294iqAtCpFsbU="
      ];
    };
  };
}
