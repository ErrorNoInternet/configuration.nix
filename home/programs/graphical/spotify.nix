{
  config,
  inputs',
  inputs,
  lib,
  ...
}: let
  cfg = config.customPrograms.graphical.spotify;
  inherit (lib) mkEnableOption mkIf;

  spicePkgs = inputs'.spicetify-nix.packages.default;
in {
  imports = [
    inputs.spicetify-nix.homeManagerModule
  ];

  options.customPrograms.graphical.spotify.enable =
    mkEnableOption "";

  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        fullAppDisplay
        volumePercentage
      ];

      theme = spicePkgs.themes.text;
      colorScheme = config.colors.schemeName;
    };
  };
}
