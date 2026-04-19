{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable {
    "electron-flags.conf".text = ''
      --enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE --enable-features=VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport --enable-features=UseMultiPlaneFormatForHardwareVideo --ignore-gpu-blocklist --enable-zero-copy
    '';
  };
}
