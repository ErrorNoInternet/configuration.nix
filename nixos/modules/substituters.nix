{
  config,
  lib,
  ...
}:
let
  caches = {
    cachix = {
      url = "https://errornobinaries.cachix.org";
      key = "errornobinaries.cachix.org-1:84oagGNCIsXxBTYmfTiP+lvWje7lIS294iqAtCpFsbU=";
      default = true;
    };
    fenix = {
      url = "https://fenix.cachix.org";
      key = "fenix.cachix.org-1:ecJhr+RdYEdcVgUkjruiYhjbBloIEGov7bos90cZi0Q=";
    };
    garnix = {
      url = "https://cache.garnix.io";
      key = "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=";
      default = true;
    };
    nix-community = {
      url = "https://nix-community.cachix.org";
      key = "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
      default = true;
    };
  };

  cfg = config.substituters;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.substituters = {
    enable = mkEnableOption "" // {
      default = true;
    };

    caches = builtins.mapAttrs (_: values: {
      enable = mkEnableOption "" // {
        inherit (values) default;
      };
    }) caches;
  };

  config = mkIf cfg.enable {
    nix.settings =
      let
        enabledCaches = builtins.filter (name: cfg.caches.${name}.enable) (builtins.attrNames caches);
      in
      {
        substituters = map (name: caches.${name}.url) enabledCaches;
        trusted-public-keys = map (name: caches.${name}.key) enabledCaches;
      };
  };
}
