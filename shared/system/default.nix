{
  inputs,
  lib,
  ...
}: {
  imports = [
    ./modules
  ];

  nix = {
    registry = let
      mappedRegistry = lib.mapAttrs' (name: flake:
        lib.nameValuePair name {inherit flake;})
      inputs;
    in
      mappedRegistry // {default = mappedRegistry.nixpkgs;};
  };

  system.stateVersion = "23.05";
}
