{
  programs.fish.shellAbbrs = {
    zf = "zfs";
    zfg = "zfs get";
    zfgf = "zfs get -t filesystem";
    zfgs = "zfs get -t snapshot";
    zfl = "zfs list";
    zflk = "zfs load-key -a";
    zfls = "zfs list -t snapshot";
    zfm = "zfs mount -a";
    zp = "zpool";
    zpg = "zpool get";
    zpi = "zpool import -al";
    zpio = "zpool iostat 1";
    zpiov = "zpool iostat -v 1";
    zpl = "zpool list";
    zplv = "zpool list -v";
    zps = "zpool status";
    zpsv = "zpool status -v";
  };
}
