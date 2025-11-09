{
  inputs,
  self,
  withSystem,
  ...
}:
let
  mkSystem =
    name: system:
    withSystem system (
      { inputs', self', ... }:
      inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit
            inputs
            inputs'
            self
            self'
            ;
        };

        modules = [
          "${self}/nixos/common.nix"
          "${self}/nixos/hosts/${name}"
          { host = { inherit name; }; }
        ];
      }
    );
in
{
  flake.nixosConfigurations = {
    zenith = mkSystem "zenith" "x86_64-linux";
  };
}
