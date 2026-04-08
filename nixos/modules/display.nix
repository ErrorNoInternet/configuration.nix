{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.display;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.display = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    users.users.error.extraGroups = [
      "i2c"
      "video"
    ];

    environment.systemPackages = with pkgs; [
      brightnessctl
      ddcutil
      timg
    ];
  };
}
