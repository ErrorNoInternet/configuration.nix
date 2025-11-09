{
  hardware = {
    graphics.enable = true;
    nvidia.open = false;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
