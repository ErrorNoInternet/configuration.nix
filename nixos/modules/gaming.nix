{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.gaming;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.gaming = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        extraCompatPackages = [ pkgs.proton-ge-bin ];
      };
    };

    environment.systemPackages = with pkgs; [
      mangohud
      osu-lazer-bin
      prismlauncher
      superTuxKart
      xonotic
    ];
  };
}
