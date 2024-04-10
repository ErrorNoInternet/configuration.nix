{
  config ? {},
  inputs',
  pkgs,
  self,
  system,
  ...
}: let
  defaultArchitectures = {
    aarch64-linux = "generic";
    x86_64-linux = "x86-64-v3";
  };
in
  builtins.listToAttrs (map (package: {
      inherit (package) name;
      value = pkgs.callPackage package.path {
        inherit inputs' self;
        host = {
          inherit system;
          architectures =
            if (config ? host)
            then {${config.host.system} = config.host.architecture;}
            else defaultArchitectures;
        };
      };
    })
    (import ./all-packages.nix))
