{
  self',
  pkgs,
  lib,
  ...
}:
let
  dsdtOverride = toString (
    pkgs.runCommand "dsdt-override.cpio" { } ''
      mkdir -p kernel/firmware/acpi
      cp ${./dsdt.aml} kernel/firmware/acpi/dsdt.aml
      echo kernel/firmware/acpi/dsdt.aml | ${pkgs.cpio}/bin/cpio -o -H newc > $out
    ''
  );
in
{
  hardware.cpu.intel.updateMicrocode = true;

  boot = {
    initrd.prepend = lib.mkAfter [ dsdtOverride ];
    kernelParams = [ "intel_iommu=on" ];
  };

  wifi.enable = true;

  services.upower.enable = true;

  hjem.users.error = {
    rum.desktops.hyprland.settings.monitor = [
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
