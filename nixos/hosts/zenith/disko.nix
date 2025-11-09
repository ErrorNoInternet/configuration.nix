{ config, ... }:
{
  fileSystems."/persist".neededForBoot = true;

  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/disk/by-id/nvme-KINGSTON_SNV2S1000G_50026B7382E7E711";

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

        luks = {
          size = "100%";
          label = "root";

          content = {
            type = "luks";

            name = "luks_${config.host.name}";
            settings.allowDiscards = true;
            extraFormatArgs = [
              "--pbkdf argon2id"
              "--pbkdf-force-iterations 8"
              "--pbkdf-memory 1048576"
              "--pbkdf-parallel 4"
            ];

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
  };
}
