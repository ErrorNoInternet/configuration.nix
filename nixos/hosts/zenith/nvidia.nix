{ config, ... }:
{
  hardware = {
    graphics.enable = true;

    nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
