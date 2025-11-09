{ lib, osConfig, ... }:
{
  environment.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "kitty";

    GLFW_IM_MODULE = "ibus";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";

    BAT_THEME = "ansi";
    HWATCH = "--no-help-banner";
    NIXOS_OZONE_WL = 1;
  }
  // lib.optionalAttrs osConfig.hardware.nvidia.enabled {
    CUDA_DISABLE_PERF_BOOST = 1;
    LIBVA_DRIVER_NAME = "nvidia";
    MOZ_DISABLE_RDD_SANDBOX = 1;
    NVD_BACKEND = "direct";
  };
}
