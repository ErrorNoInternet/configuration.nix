{
  boot.initrd.availableKernelModules = [
    "amdgpu"
    "applesmc"
    "applespi"
    "firewire_ohci"
    "intel_lpss_pci"
    "radeon"
    "simpledrm"
    "spi_pxa2xx_platform"
  ];

  networking.enableB43Firmware = true;

  wifi.enable = true;

  services.kmscon.hwRender = false;

  hjem.users.error.rum.desktops.hyprland.settings.monitor = [
    "         , preferred     , auto    , 1"
  ];
}
