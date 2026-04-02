{ self', ... }:
{
  hardware.cpu.intel.updateMicrocode = true;

  boot.kernelParams = [
    "intel_iommu=on"
    "nosgx"
  ];

  wifi.enable = true;

  services.upower.enable = true;

  hjem.users.error = {
    rum.desktops.hyprland.settings.monitor = [
      "HDMI-A-1 , 1920x1080@144 , 0x0     , 1"
      "         , preferred     , auto    , 1"
    ];

    systemd.services.gamma-control = {
      enable = false;

      after = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      wantedBy = [ "graphical-session.target" ];

      script = ''
        pkill -x gamma-control || true
        ${self'.packages.gamma-control}/bin/gamma-control -c 0.4 -b 0.95 -g 1.5
      '';
    };
  };
}
