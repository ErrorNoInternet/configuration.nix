{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  environment.variables.HOSTNAME = "Rescanix";
  networking = {
    hostName = "Rescanix";
    hostId = "3a1f6cc6";
  };

  boot = {
    loader = {
      timeout = lib.mkForce 5;
      systemd-boot = {
        memtest86.enable = true;
        netbootxyz.enable = true;
      };
    };
    kernelParams = [
      "boot.shell_on_fail"
    ];
    supportedFilesystems = ["exfat" "xfs"];
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [hplip];
  };
  services.xserver.desktopManager.plasma5.enable = true;
}
