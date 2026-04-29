{ lib, osConfig, ... }:
{
  environment.sessionVariables = {
    TERMINAL = "kitty";

    BAT_THEME = "ansi";
    FERRITIN_THEME = "zenburn";
    GOPATH = "${osConfig.hjem.users.error.directory}/.go";
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
