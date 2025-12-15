{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.rpi;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.rpi = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    boot = {
      loader = {
        grub.enable = false;
        generic-extlinux-compatible = {
          enable = true;
          configurationLimit = 10;
        };
      };

      kernelParams = [
        "console=ttyS0,115200n8"
        "console=ttyAMA0,115200n8"
        "console=tty0"
        "root=/dev/disk/by-label/NIXOS_SD"
        "rootfstype=btrfs"
        "rootflags=subvol=@"
        "rootwait"
      ];

      initrd.kernelModules = [
        "zstd"
        "btrfs"
      ];
    };

    fileSystems =
      let
        defaultOptions = [ "compress=zstd" ];
        device = "/dev/disk/by-label/NIXOS_SD";
        fsType = "btrfs";
      in
      {
        "/" = {
          inherit device fsType;
          options = [ "subvol=@" ] ++ defaultOptions;
        };
        "/home" = {
          inherit device fsType;
          options = [ "subvol=@home" ] ++ defaultOptions;
        };
        "/nix" = {
          inherit device fsType;
          options = [
            "subvol=@nix"
            "noatime"
          ]
          ++ defaultOptions;
        };
        "/persist" = {
          inherit device fsType;
          neededForBoot = true;
          options = [ "subvol=@persist" ] ++ defaultOptions;
        };
        "/boot/firmware" = {
          device = "/dev/disk/by-label/FIRMWARE";
          fsType = "vfat";
          options = [
            "noauto"
            "nofail"
          ];
        };
      };

    nixpkgs.overlays =
      let
        ubootWithBtrfsAndZstd = _: {
          extraConfig = ''
            CONFIG_CMD_BTRFS=y
            CONFIG_ZSTD=y

            CONFIG_BOOTCOMMAND="setenv boot_prefixes /@boot/ /@/ /boot/ /; run distro_bootcmd;"
          '';
        };
      in
      [
        (_: super: {
          ubootRaspberryPi3_64bit = super.ubootRaspberryPi3_64bit.overrideAttrs ubootWithBtrfsAndZstd;
          ubootRaspberryPi4_64bit = super.ubootRaspberryPi4_64bit.overrideAttrs ubootWithBtrfsAndZstd;
        })
      ];

    environment.systemPackages = [ pkgs.libraspberrypi ];
  };
}
