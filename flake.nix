{
  inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    base16.url = "github:SenchoPens/base16.nix";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        hjem.follows = "hjem";
      };
    };

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-super = {
      url = "github:privatevoid-net/nix-super";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs-23-11.follows = "nixpkgs";
        nixpkgs-regression.follows = "nixpkgs";
        nixpkgs.follows = "nixpkgs";
      };
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    shadower.url = "github:n3oney/shadower";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, self, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./nixos
        ./shells
      ];

      perSystem =
        {
          inputs',
          pkgs,
          ...
        }:
        {
          packages = import ./packages {
            inherit
              inputs'
              pkgs
              self
              ;
          };

          formatter = pkgs.nixfmt;
        };

      flake.pins = import ./npins;

      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
    };

  description = "ErrorNoInternet's NixOS configuration";
}
