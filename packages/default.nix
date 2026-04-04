{ inputs, self, ... }:
{
  perSystem =
    {
      inputs',
      pkgs,
      ...
    }:
    {
      packages = builtins.listToAttrs (
        map (
          src:
          let
            pkg = pkgs.callPackage src {
              inherit inputs inputs' self;
            };
          in
          {
            name = pkg.pname or pkg.name;
            value = pkg;
          }
        ) (import ./list.nix)
      );
    };
}
