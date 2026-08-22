{ osConfig, ... }:
{
  environment.sessionVariables = {
    TERMINAL = "kitty";

    BAT_THEME = "ansi";
    FERRITIN_THEME = "zenburn";
    GOPATH = "${osConfig.hjem.users.error.directory}/.go";
    HWATCH = "--no-help-banner";

    NIXOS_OZONE_WL = 1;
  };
}
