{ inputs, self, ... }:
{
  perSystem =
    {
      inputs',
      pkgs,
      self',
      ...
    }:
    {
      packages = builtins.listToAttrs (
        map (
          src:
          let
            pkg = pkgs.callPackage src {
              inherit
                inputs
                inputs'
                self
                self'
                ;
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
