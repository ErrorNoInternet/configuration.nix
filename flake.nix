{
  description = "ErrorNoInternet's NixOS configuration";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    agenix.url = "github:ryantm/agenix";
    nix-colors.url = "github:misterio77/nix-colors";

    attic.url = "github:zhaofengli/attic";
    hsize.url = "github:ErrorNoInternet/hsize";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-super.url = "github:privatevoid-net/nix-super";
    nixvim.url = "github:nix-community/nixvim";
    overmask.url = "github:ErrorNoInternet/overmask";
    paralload.url = "github:ErrorNoInternet/Paralload";
    shadower.url = "github:n3oney/shadower";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    waybar.url = "github:Alexays/Waybar";
    wezterm.url = "github:wez/wezterm?dir=nix";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./droid
        ./library
        ./packages
        ./server
        ./workstation
      ];

      systems = ["aarch64-linux" "x86_64-linux"];
      perSystem = {
        inputs',
        pkgs,
        self',
        ...
      }: {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          name = "configuration.nix-shell";
          packages = with pkgs; [
            alejandra
            bat
            deadnix
            delta
            git
            inputs'.agenix.packages.default
            self'.packages.neovim
            self'.packages.nix
            statix
          ];
        };
      };
    };
}
