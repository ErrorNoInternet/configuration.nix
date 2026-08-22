{ pkgs, ... }: {
  hardware = {
    graphics = {
      enable = true;

      extraPackages = [ pkgs.intel-media-driver ];
    };

    nvidia = {
      open = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        intelBusId = "PCI:0@0:2:0";
        nvidiaBusId = "PCI:1@0:0:0";
      };
    };
  };

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];
}
