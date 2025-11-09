{
  lib,
  osConfig,
  pkgs,
  ...
}:
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable {
    "satty/config.toml".source = (pkgs.formats.toml { }).generate "config.toml" {
      general = {
        copy-command = "wl-copy";
        disable-notifications = true;
        early-exit = true;
        initial-tool = "rectangle";
      };
    };
  };
}
