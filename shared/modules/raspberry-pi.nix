{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.shared.flags.isRaspberryPi {
    boot.loader = {
      grub.enable = false;
      generic-extlinux-compatible = {
        enable = true;
        configurationLimit = 10;
      };
    };
    environment.systemPackages = [pkgs.libraspberrypi];
  };
}
