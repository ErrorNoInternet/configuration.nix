{
  snapper.interval = "0/4:0";

  fileSystems."/mnt/moss" = {
    device = "moss.local:/export/error";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
    ];
  };
}
