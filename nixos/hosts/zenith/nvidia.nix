{ config, self, ... }:
{
  nixpkgs.overlays = [
    (_: super: {
      nvidia-vaapi-driver = super.nvidia-vaapi-driver.overrideAttrs (_old: {
        src = self.pins.nvidia-vaapi-driver;
      });
    })
  ];

  hardware = {
    graphics.enable = true;

    nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
