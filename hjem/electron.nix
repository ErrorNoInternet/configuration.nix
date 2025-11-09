{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable {
    "electron-flags.conf".text = ''
      --enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCopyGL,UseOzonePlatform,VaapiOnNvidiaGPUs,WaylandLinuxDrmSyncobj --ozone-platform-hint=auto --enable-wayland-ime
    '';
  };
}
