{
  config,
  lib,
  ...
}: {
  options.caches.nix-community.enable = lib.mkEnableOption "";

  config = lib.mkIf config.caches.nix-community.enable {
    nix.settings = {
      substituters = ["https://nix-community.cachix.org"];
      trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
    };
  };
}
