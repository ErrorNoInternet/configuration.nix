{
  boot = {
    initrd.availableKernelModules = [
      "applesmc"
      "applespi"
      "firewire_ohci"
      "intel_lpss_pci"
      "spi_pxa2xx_platform"
    ];

    plymouth.enable = true;
  };

  networking.enableB43Firmware = true;

  wifi.enable = true;
}
