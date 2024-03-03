{
  programs.fish.shellAbbrs = {
    zf = "zfs";
    zp = "zpool";

    zfg = "zfs get";
    zfgf = "zfs get -t filesystem";
    zfl = "zfs list";
    zflk = "zfs load-key -a";
    zfls = "zfs list -t snapshot";
    zfm = "zfs mount -a";
    zpg = "zpool get";
    zpi = "zpool import -al";
    zpio = "zpool iostat";
    zpiov = "zpool iostat -v";
    zpl = "zpool list";
    zplv = "zpool list -v";
    zps = "zpool status";
    zpsv = "zpool status -v";
  };
}
