{config, ...}: {
  disko.devices.disk.primary = {
    type = "disk";
    device = "/dev/sda";

    content = {
      type = "gpt";

      partitions = {
        ESP = {
          size = "512M";
          type = "EF00";
          label = "BOOT";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };

        root = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [
              "-L ${config.host.name}"
              "-O bgt"
            ];

            subvolumes = {
              "@" = {
                mountpoint = "/";
                mountOptions = ["compress=zstd"];
              };
              "@home" = {
                mountpoint = "/home";
                mountOptions = ["compress=zstd"];
              };
              "@var" = {
                mountpoint = "/var";
                mountOptions = ["compress=zstd"];
              };
              "@nix" = {
                mountpoint = "/nix";
                mountOptions = ["compress=zstd" "noatime"];
              };
            };
          };
        };
      };
    };
  };
}
