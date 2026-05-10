{ pkgs, ... }:
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

  systemd.services.load-backlight = {
    description = "Load Backlight (radeon_bl0)";

    after = [ "systemd-user-sessions.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };

    script = ''
      ${pkgs.systemd}/lib/systemd/systemd-backlight load backlight:radeon_bl0
    '';
  };
}
