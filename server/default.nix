{
  inputs,
  self,
  withSystem,
  ...
}: let
  mkSystem = name: system:
    withSystem system ({
      inputs',
      self',
      ...
    }:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs' inputs self' self;};
        modules = [
          ./common.nix
          ./hosts/${name}
          ./hosts/${name}/hardware.nix
          {host = {inherit name system;};}
        ];
      });

  mkHmSystem = name: system:
    withSystem system ({
      inputs',
      self',
      ...
    }:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs' inputs self' self;};
        modules = [
          ./common.nix
          ./hosts/${name}
          ./hosts/${name}/hardware.nix
          {host = {inherit name system;};}

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs' inputs self' self;};

              users.snowflake = {...}: {
                imports = [
                  ../home/common.nix
                  ../home/hosts/${name}.nix
                ];
              };
            };
          }
        ];
      });
in {
  flake.nixosConfigurations = {
    Crix = mkSystem "Crix" "x86_64-linux";
    Pix = mkHmSystem "Pix" "aarch64-linux";
  };
}
