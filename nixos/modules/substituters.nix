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

    garnix = mkEnableOption "" // {
      default = true;
    };

    nix-community = mkEnableOption "" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    nix.settings = {
      substituters =
        (optionals cfg.cachix [ "https://errornobinaries.cachix.org" ])
        ++ (optionals cfg.garnix [ "https://cache.garnix.io" ])
        ++ (optionals cfg.nix-community [ "https://nix-community.cachix.org" ]);
      trusted-public-keys =
        (optionals cfg.cachix [
          "errornobinaries.cachix.org-1:84oagGNCIsXxBTYmfTiP+lvWje7lIS294iqAtCpFsbU="
        ])
        ++ (optionals cfg.garnix [
          "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        ])
        ++ (optionals cfg.nix-community [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ]);
    };
  };
}
