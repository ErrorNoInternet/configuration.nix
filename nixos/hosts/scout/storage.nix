{ config, ... }:
{
  snapper = {
    enable = true;
    interval = "0/4:0";
  };

  fileSystems."/persist".neededForBoot = true;

  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/mmcblk0";

    content = {
      type = "gpt";

      partitions = {
        ESP = {
          size = "1G";
          type = "EF00";
          label = "boot";

          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };

        root = {
          size = "100%";
          label = "root";

          content = {
            type = "btrfs";
            extraArgs = [
              "-L ${config.host.name}"
              "-O bgt"
            ];

            subvolumes = {
              "@" = {
                mountpoint = "/";
                mountOptions = [ "compress=zstd" ];
              };
              "@home" = {
                mountpoint = "/home";
                mountOptions = [ "compress=zstd" ];
              };
              "@nix" = {
                mountpoint = "/nix";
                mountOptions = [
                  "compress=zstd"
                  "noatime"
                ];
              };
              "@persist" = {
                mountpoint = "/persist";
                mountOptions = [ "compress=zstd" ];
              };
            };
          };
        };
      };
    };
  };
}
