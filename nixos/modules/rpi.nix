{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.rpi;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.rpi = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    boot.loader = {
      grub.enable = false;
      generic-extlinux-compatible = {
        enable = true;
        configurationLimit = 10;
      };
    };

    environment.systemPackages = [ pkgs.libraspberrypi ];

    hardware.enableRedistributableFirmware = true;
  };
}
