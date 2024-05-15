{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkForce;
in {
  time.hardwareClockInLocalTime = true;

  boot = {
    loader = {
      timeout = lib.mkForce 5;
      grub.memtest86.enable = true;
    };

    supportedFilesystems = [
      "apfs"
      "exfat"
      "f2fs"
      "nilfs2"
      "xfs"
    ];
  };

  nixos.wireless.enable = mkForce false;
  networking.networkmanager.enable = true;

  services.printing = {
    enable = true;
    drivers = [pkgs.hplip];
  };

  workstation = {
    kernel.patches.removeUnused = false;

    zfs.enable = true;

    sddm.enable = true;

    profiles.qemuGuest.enable = true;

    desktops = {
      hyprland.enable = true;
      plasma5.enable = true;
    };
  };

  specialisation.lts-kernel = self.lib.nixos.mkSpecialisation "lts-kernel" {
    workstation.zfs.kernelPackages = config.workstation.kernel.availablePackages.lts;
  };
}
