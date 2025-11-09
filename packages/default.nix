{
  inputs',
  pkgs,
  self,
  ...
}:
builtins.listToAttrs (
  map (package: {
    inherit (package) name;
    value = pkgs.callPackage package.source {
      inherit inputs' self;
    };
  }) (import ./list.nix)
)
