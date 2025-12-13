{ pkgs, self', ... }:
{
  hardware.cpu.intel.updateMicrocode = true;

  boot.kernelParams = [
    "intel_iommu=on"
    "nosgx"
  ];

  wifi.enable = true;

  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  systemd.services.power-profile-performance = {
    wantedBy = [ "multi-user.target" ];
    after = [ "power-profiles-daemon.service" ];
    requires = [ "power-profiles-daemon.service" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance";
    };
  };

  hjem.users.error.systemd.services.gamma-control = {
    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    script = ''
      pkill -x gamma-control || true
      ${self'.packages.gamma-control}/bin/gamma-control -c 0.4 -b 0.95 -g 1.5
    '';
  };
}
