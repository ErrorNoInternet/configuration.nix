{
  config,
  inputs',
  lib,
  ...
}:
let
  cfg = config.spicetify;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.spicetify = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    programs.spicetify =
      let
        spicePkgs = inputs'.spicetify-nix.legacyPackages;
      in
      {
        enable = true;

        theme = spicePkgs.themes.lucid;
        enabledExtensions = with spicePkgs.extensions; [
          adblock
          beautifulLyrics
          fullAppDisplayMod
          keyboardShortcut
          songStats
          volumePercentage
        ];
        enabledCustomApps = with spicePkgs.apps; [
          lyricsPlus
          marketplace
          ncsVisualizer
        ];
      };
  };
}
