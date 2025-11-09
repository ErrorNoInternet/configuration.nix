{
  xdg.config.files."electron-flags.conf".text = ''
    --enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCopyGL,UseOzonePlatform,VaapiOnNvidiaGPUs,WaylandLinuxDrmSyncobj --ozone-platform-hint=auto --enable-wayland-ime
  '';
}
