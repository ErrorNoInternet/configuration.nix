{ lib, osConfig, ... }:
{
  environment.sessionVariables = {
    BAT_THEME = "ansi";
    FERRITIN_THEME = "zenburn";
    GOPATH = "${osConfig.hjem.users.error.directory}/.go";
    HWATCH = "--no-help-banner";
    NIXOS_OZONE_WL = 1;
    TERMINAL = "kitty";
    TMOUT = 86400;
  }
  // lib.optionalAttrs osConfig.hardware.nvidia.enabled {
    GAMEMODERUNEXEC = "nvidia-offload";
  };
}
