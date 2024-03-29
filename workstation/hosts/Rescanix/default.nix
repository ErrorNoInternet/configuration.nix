{
  lib,
  pkgs,
  ...
}: {
  host.id = "3a1f6cc6";

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

  services.printing = {
    enable = true;
    drivers = [pkgs.hplip];
  };

  workstation = {
    sddm.enable = true;

    profiles.qemuGuest.enable = true;

    desktops = {
      hyprland.enable = true;
      plasma5.enable = true;
    };
  };
}
