{
  inputs',
  pkgs,
  self,
  ...
}:
builtins.listToAttrs (
  map (
    src:
    let
      pkg = pkgs.callPackage src {
        inherit inputs' self;
      };
    in
    {
      name = pkg.pname or pkg.name;
      value = pkg;
    }
  ) (import ./list.nix)
)
